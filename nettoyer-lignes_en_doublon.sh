#!/bin/sh
# nettoyer.sh - analyze AU-DELA dictionary for errors
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

RemoveDuplicatedLines()
{
    for DIRECTORY in expressions mots noms
    do
        for FILE in ${DIRECTORY}/*
        do
            cat ${FILE} | sort | uniq > ${TMPFILE}
            OLD_HASH=`md5 -q ${FILE}`
            NEW_HASH=`md5 -q ${TMPFILE}`
            if [ "${OLD_HASH}" != "${NEW_HASH}" ]
            then
                echo "${FILE} contains duplicated lines"
                mv ${TMPFILE} ${FILE}
            fi
        done
    done
    for DIRECTORY in verbes
    do
        for FILE in ${DIRECTORY}/*
        do
            cat ${FILE} | sort | uniq | sort -t "|" -k 2 > ${TMPFILE}
            OLD_HASH=`md5 -q ${FILE}`
            NEW_HASH=`md5 -q ${TMPFILE}`
            if [ "${OLD_HASH}" != "${NEW_HASH}" ]
            then
                echo "${FILE} contains duplicated lines"
                mv ${TMPFILE} ${FILE}
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

RemoveDuplicatedLines
