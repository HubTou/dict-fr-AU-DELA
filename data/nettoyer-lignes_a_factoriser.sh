#!/bin/sh
# nettoyer-lignes_a_factoriser.sh - analyze AU-DELA dictionary for errors
# License: 3-clause BSD (see https://opensource.org/licenses/BSD-3-Clause)
# Author: Hubert Tournier

TMPFILE=${TMP}/formats.$$

AU_DELA=dict-fr-AU-DELA

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

FactorFlexions()
{
    grep "^${1}:" \
    | sed "s/^[^:]*//" \
    | tr : \\n \
    | grep -v "^$" \
    | sort \
    | uniq \
    | tr "\n" ":" \
    | sed -e "s/^/:/" -e "s/:$//"
}

FactorFactorableLines()
{
    for DIRECTORY in expressions mots noms
    do
        for FILE in ${DIRECTORY}/*
        do
            cat ${FILE} | sed "s/:.*//" | sort | uniq -d > ${TMPFILE}.keys
            NB_LINES=`cat ${TMPFILE}.keys | wc -l | sed "s/[^0-9]//g"`
            if [ "${NB_LINES}" != "0" ]
            then
                echo "${FILE} contains factorable flexions"
                cp ${FILE} ${FILE}.new1
                cat ${TMPFILE}.keys \
                | while read KEY
                do
                    FACTORED_FLEXIONS=`cat ${FILE}.new1 | FactorFlexions "${KEY}"`
                    grep -v "^${KEY}:" ${FILE}.new1 > ${FILE}.new2
                    echo "${KEY}${FACTORED_FLEXIONS}" >> ${FILE}.new2
                    mv ${FILE}.new2 ${FILE}.new1
                done
                sort ${FILE}.new1 > ${FILE}
                rm ${FILE}.new1
            fi
        done
    done
    for DIRECTORY in verbes
    do
        for FILE in ${DIRECTORY}/*
        do
            cat ${FILE} | sed "s/:.*//" | sort | uniq -d > ${TMPFILE}.keys
            NB_LINES=`cat ${TMPFILE}.keys | wc -l | sed "s/[^0-9]//g"`
            if [ "${NB_LINES}" != "0" ]
            then
                echo "${FILE} contains factorable flexions"
                cp ${FILE} ${FILE}.new1
                cat ${TMPFILE}.keys \
                | while read KEY
                do
                    FACTORED_FLEXIONS=`cat ${FILE}.new1 | FactorFlexions "${KEY}"`
                    grep -v "^${KEY}:" ${FILE}.new1 > ${FILE}.new2
                    echo "${KEY}${FACTORED_FLEXIONS}" >> ${FILE}.new2
                    mv ${FILE}.new2 ${FILE}.new1
                done
                sort -t "|" -k 2 ${FILE}.new1 > ${FILE}
                rm ${FILE}.new1
            fi
        done
    done
    rm -f ${TMPFILE}
}

if [ ! -f dict-fr-AU-DELA ]
then
    echo "I need the current state dict-fr-AU-DELA file to check for errors"
    exit 1
fi

FactorFactorableLines

