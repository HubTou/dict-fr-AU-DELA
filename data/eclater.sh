#!/bin/sh
# eclater.sh - split DELA dictionary in multiple editable parts
# License: 3-clause BSD (see https://opensource.org/licenses/BSD-3-Clause)
# Author: Hubert Tournier

TMPFILE=${TMP}/formats.$$
MAX_LINES=10000

Convert()
# From UTF-16 encoding with MS-DOS end of lines to UTF-8 & Unix EOL.
{
    iconv -f UTF-16 -t UTF-8 \
    | sed "s///"
}

UnEscape()
# The original dictionary escapes ".", "," and "-" characters with a leading backslash.
# We remove these ones carefully while changing the fields separators from "," and "." to "|".
# Besides homogeneity, the "|" character will be easier for GitHub edition...
{
    sed	-e "s/\\\\,/~/g" \
        -e "s/,/|/g" \
        -e "s/~/,/g" \
        -e "s/\\\\\\./~/g" \
        -e "s/\\./|/g" \
        -e "s/~/./g" \
        -e "s/\\\\//g"
}

ExplodeOnField1()
# Some starting letters have more than several K lines associated.
# We split these ones into multiple files.
{
    rm -rf $1
    mkdir -p $1
    awk -vDIRECTORY=$1 -vMAX_LINES=${MAX_LINES} '
        {
            first_letter = substr($0,0,1)
            if (first_letter !~ /[A-Za-z]/)
            {
                first_letter = "0"
            }
            if (first_letter ~ /[A-Z]/)
            {
                first_letter = tolower(first_letter)
            }
            lines[first_letter] += 1
            if ((lines[first_letter] % MAX_LINES) == 0)
            {
                parts[first_letter] = (1 + (lines[first_letter] / MAX_LINES)) ""
            }
            file = DIRECTORY "/" first_letter parts[first_letter]
            print $0 >> file
        }
    '
}

ExplodeOnField2()
# Some starting letters have more than several K lines associated.
# We split these ones into multiple files.
{
    rm -rf $1
    mkdir -p $1
    awk -vDIRECTORY=$1 -vMAX_LINES=${MAX_LINES} '
        BEGIN {
            FS = "|"
        }
        {
            first_letter = substr($2,0,1)
            if (first_letter == "")
            {
                first_letter = substr($1,0,1)
            }
            if (first_letter !~ /[A-Za-z]/)
            {
                first_letter = "0"
            }
            if (first_letter ~ /[A-Z]/)
            {
                first_letter = tolower(first_letter)
            }
            lines[first_letter] += 1
            if ((lines[first_letter] % MAX_LINES) == 0)
            {
                parts[first_letter] = (1 + (lines[first_letter] / MAX_LINES)) ""
            }
            file = DIRECTORY "/" first_letter parts[first_letter]
            print $0 >> file
        }
    '
}

main()
{
    if [ ! -f dela-fr-public.dic ]
    then
        echo "Downloading"
	    fetch -q http://infolingu.univ-mlv.fr/DonneesLinguistiques/Dictionnaires/dela-fr-public.zip

        echo "Uncompressing"
	    unzip -q dela-fr-public.zip
    fi
    echo "Converting"
    cat dela-fr-public.dic | Convert | UnEscape > ${TMPFILE}.0

    # proper nouns extraction:
    echo "Extracting proper nouns"
    cat ${TMPFILE}.0 | grep "+NPropre" | sort | ExplodeOnField1 noms
    cat ${TMPFILE}.0 | grep -v "+NPropre" > ${TMPFILE}.1

    # compound words extraction:
    echo "Extracting composed words"
    cat ${TMPFILE}.1 | grep " " | sort | ExplodeOnField1 expressions
    cat ${TMPFILE}.1 | grep -v " " > ${TMPFILE}.2

    # verbs extraction:
    echo "Extracting verbs"
    cat ${TMPFILE}.2 | grep "|V" | sort -t "|" -k 2 | ExplodeOnField2 verbes

    # words left:
    echo "Extracting words"
    cat ${TMPFILE}.2 | grep -v "|V" | sort | ExplodeOnField1 mots

    for PATHNAME in expressions/*2 verbes/*2 mots/*2
    do
        PREFIX=`echo "${PATHNAME}" | sed "s/2$//"`
        mv ${PREFIX} ${PREFIX}1
    done
}

main

rm -f dela-fr-public.zip ${TMPFILE}.*
