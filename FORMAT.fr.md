# Format des entrées de la version éditable du dictionnaire DELA
## Format général
Les formes flèchies sont représentées par la syntaxe suivante:

`mot séparateur [lemme] séparateur catégorie[+sous_classe ...][:flexion ...]`

où :
* *mot* peut être une entrée composée (avec espaces)
* *séparateur* est le caractère *tube* ("|")
* *lemme* est la forme non flèchie du mot (mot non accordé, verbe non conjugué, etc.), présente seulement quand elle est différente du *mot*

## Codification des catégories
Code|Occurrences uniques|Description
---|---|---
V|464.181|Verbes avec formes conjuguées
N|236.110|noms communs ou propres, simples ou composés
A|74.865|Adjectifs avec formes accordées
ADV|7.655|Adverbes
PREP|3.408|Prépositions
NDET|2.773|?
GN|952|Locutions nominales
PFX|863|Préfixes
DET|276|Déterminants (dont nombres en toutes lettres)
CONJS|219|Conjonctions de subordination
INTJ|207|Interjections
X|139|Mots d'origine étrangère ? Différence avec XI ?
GNP|133|Autres locutions nominales ? Différence avec GNPX ?
GNPX|131|Autres locutions nominales ? Différence avec GNP ?
PRO|105|Pronoms. Différence avec PRON ?
PRON|47|Pronoms avec formes accordées. Différence avec PRO ?
PCDN3|20|Locutions prépositives ?
CONJC|10|Conjonctions de coordination
XI|10|Mots d'origine étrangère ? Différence avec X ?
PREPADJ|6|Adjectifs démonstratifs ?
PREPPRO|6|Pronoms relatifs ?
PREPDET|4|Articles (in)définis ?

## Codification des sous-classes
Tout ça reste assez mystérieux.
Voici ce que j'ai retenu :

Catégorie|Code|Description 
---|---|--- 
DET|Dnum|Déterminants numéraux
N|NPropre|Noms propres
\*|z1|Mais qu'est-ce donc ???
\*|z2|Mais qu'est-ce donc ???

## Codification des flexions
### Genre et nombre
Code|Description
---|---
fp|féminin pluriel
fs|féminin singulier
mp|masculin pluriel
ms|masculin singulier

### Conjugaisons
Les flexions sont représentées par la syntaxe suivante:

`: temps [personne nombre]`

où :
* *temps* est l'une des lettres de la liste suivante
* *personne* vaut "1", "2" ou "3"
* *nombre* vaut "s" pour le singulier, "p" pour le pluriel

Ainsi "P1s" signifie "présent de l'indicatif à la première personne du singulier".

Code|Mode|Temps|Commentaire
---|---|---|---
W|Infinitif||
P|Indicatif|Présent|
I|Indicatif|Imparfait|
J|Indicatif|Passé simple|
F|Indicatif|Futur simple|
C|Conditionnel|Présent|
S|Subjonctif|Présent|
T|Subjonctif|Passé|
G|Participe|Présent|
K|Participe|Passé|Les formes ms, mp, fs, fp existent
Y|Impératif||Seules les formes 2s, 1p et 2p existent

Les autres temps peuvent être construits à partir de ceux-ci...

### Pronoms
On trouve les formes 1s, 1p, 2s, 2p, 3s, 3p, 3ms, 3mp, 3fs et 3fp, explicitées par ce qui précède.
