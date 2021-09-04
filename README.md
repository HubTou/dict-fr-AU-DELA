# Installation
pip install [dict-fr-AU-DELA](https://pypi.org/project/dict-fr-AU-DELA/)

# EDITABLE French dictionaries from Laboratoire d'Automatique Documentaire et Linguistique (LADL)

## DESCRIPTION
Starting from the original [inflected form DELA French dictionary](https://infolingu.univ-mlv.fr/DonneesLinguistiques/Dictionnaires/telechargement.html),
provided by the former [Laboratoire d'Automatique Documentaire et Linguistique](https://infolingu.univ-mlv.fr/LADL/Historique.html) (LADL),
now integrated into [Institut Gaspard Monge](https://igm.univ-gustave-eiffel.fr/) (IGM) of the [Université Gustave Eiffel](https://www.univ-gustave-eiffel.fr/),
this repository contains:
* *modified* dictionary data, publicly [editable here](https://github.com/HubTou/dict-fr-AU-DELA/tree/main/data);
* a Python package gathering the results for exploitation by other tools.

The selected original dictionary is the inflected form DELA French dictionary in UTF-16 LE encoding,
from March 16, 2006, with 683.824 simple entries for 102.073 different lemmas and 108.436 compounded entries for 83.604 different lemmas.

## FILES
All files are installed in Python's */usr/local* equivalent, under *share/dict*.

### Original files

Filename|Description
---|---
dict-fr-AU-DELA-License|Lesser General Public License For Linguistic Resources

### Generated files

Filename|Description
---|---
dict-fr-AU-DELA|Modified inflected form DELA French dictionary in UTF-8 encoding and Unix-style end of lines
dict-fr-AU-DELA.ascii|French words and compound words list (unaccented)
dict-fr-AU-DELA.unicode|742.889 entries French words and compound words list (accented)
dict-fr-AU-DELA.combined|French words and compound words list (with both accented and unaccented words)
dict-fr-AU-DELA-proper_nouns.ascii|French proper nouns list (unaccented, sometimes compounded)
dict-fr-AU-DELA-proper_nouns.unicode|823 entries French proper nouns list (accented, sometimes compounded)
dict-fr-AU-DELA-proper_nouns.combined|French proper nouns list (with both accented and unaccented words, sometimes compounded)
dict-fr-AU-DELA-common-words.ascii|French common words list (unaccented)
dict-fr-AU-DELA-common-words.unicode|641.759 entries French common words list (accented)
dict-fr-AU-DELA-common-words.combined|French common words list (with both accented and unaccented words)
dict-fr-AU-DELA-common-compound-words.ascii|French common compound words list (unaccented)
dict-fr-AU-DELA-common-compound-words.unicode|100.320 entries French common compound words list (accented)
dict-fr-AU-DELA-common-compound-words.combined|French common compound words list (with both accented and unaccented words)

Beside manual edits, apart from the *dict-fr-AU-DELA* file, these generated files went through the following transformations:
* removal of escape backslashes
* removal of lemma and grammatical info from *dict-fr-AU-DELA*
* lossless conversion of accents for the *\*-ascii* versions
* combination of the *\*-ascii* and *\*-unicode* versions into the *\*-combined* ones (without duplicates)

## SEE ALSO
[spell(1)](https://www.freebsd.org/cgi/man.cgi?query=spell) like tools,
[anagram(6)](https://github.com/HubTou/anagram/blob/main/README.md),
[conjuguer(1)](https://github.com/HubTou/conjuguer/blob/main/README.md)

## HISTORY
DELA means "Dictionnaire Electronique du LADL" (LADL's electronic dictionaries). These dictionaries were initiated by the lab's founder, [Maurice Gross](https://fr.wikipedia.org/wiki/Maurice_Gross).

This modified version of the [original DELA dictionary](https://github.com/HubTou/dict-fr-DELA) was necessary because our [PNU project](https://github.com/HubTou/PNU)'s
[conjuguer](https://github.com/HubTou/conjuguer) command made it clear that there were errors in some verb conjugations.

It was naturally called AU-DELA, a pun meaning beyond DELA ("au-delà" in French being translated as "beyond").

I wrote an [history of Unix & French dictionaries](https://github.com/HubTou/PNU/wiki/Les-dictionnaires-sous-Unix) (in French only),
which covers this dictionary and many others.

## LICENSE
The original contents, as well as this package, are licensed under the [Lesser General Public License For Linguistic Resources](http://infolingu.univ-mlv.fr/DonneesLinguistiques/Lexiques-Grammaires/lgpllr.html).

## AUTHORS
[Laboratoire d'Automatique Documentaire et Linguistique](https://infolingu.univ-mlv.fr/LADL/Historique.html) (LADL) for the original contents.

[Hubert Tournier](https://github.com/HubTou) for the package and some initial changes.

The GitHub community for further changes.
