# Format des entrées de la version éditable du dictionnaire DELA
## Format général
Les entrées du dictionnaire sont représentées par la syntaxe suivante:

`entrée séparateur [lemme] séparateur catégorie[+sous_classe ...][:flexion ...] séparateur commentaire`

`/commentaire`

où :
* *entrée* est la forme fléchie, c'est-à-dire potentiellement accordée ou conjuguée, d'un mot ou d'une entrée composée (mots séparés par des espaces)
* *séparateur* est dans cette version le caractère *tube* ("|"), mais dans le format d'origine une virgule (",") puis un point ("."), puis une barre oblique ("/"). Le troisième séparateur est facultatif
* *lemme* est la forme canonique, non fléchie, de l'entrée, c'est-à-dire non accordée ou conjuguée, généralement absente quand elle est identique à celle-ci
* *catégorie* est la classe grammaticale de l'entrée (cf. valeurs exhaustives observées ci-dessous), par exemple A pour un adjectif, V pour un verbe...
* *+sous_classe* est un ensemble de codes donnant des informations grammaticales et sémantiques (facultatif, valeurs multiples possibles où le caractère "+" s'interprète comme un ET logique, liste ouverte)
* *:flexion* est un ensemble de codes flexionnels (facultatif, valeurs multiples possibles où le caractère ":" s'interprète comme un OU logique)
* *commentaire*: est un texte libre (facultatif)

Notre version ne nécessite pas de précautions particulières pour l'emploi des caractères virgule et point, mais le caractère "tube" ("|") est interdit.
Dans la version d'origine les caractères virgule, point et tiret sont "échappés" avec une barre oblique inversée ("\\").

## Codification des catégories grammaticales
Code|Occurrences uniques|Description
---|---|---
A|74.865|Adjectifs
ADV|7.655|Adverbes
CONJC|10|Conjonctions de coordination
CONJS|219|Conjonctions de subordination
DET|276|Déterminants
INTJ|207|Interjections
N|236.110|noms
PREP|3.408|Prépositions
PRO|105|Pronoms
V|464.181|Verbes

### Autres catégories grammaticales rencontrées
Code|Occurrences uniques|Description
---|---|---
NDET|2.773|?
GN|952|Locutions nominales
PFX|863|Préfixes
X|139|Mots d'origine étrangère ? Différence avec XI ?
GNP|133|Autres locutions nominales ? Différence avec GNPX ?
GNPX|131|Autres locutions nominales ? Différence avec GNP ?
PRON|47|Pronoms avec formes accordées. Différence avec PRO ?
PCDN3|20|Locutions prépositives ?
XI|10|Mots d'origine étrangère ? Différence avec X ?
PREPADJ|6|Adjectifs démonstratifs ?
PREPPRO|6|Pronoms relatifs ?
PREPDET|4|Articles (in)définis ?

## Codification des sous-classes sémantiques
Voici quelques codes usuels :

Catégorie|Code|Description 
---|---|--- 
A|d|Indique que l'adjectif se place à droite du nom
DET|Dnum|Déterminants numéraux
N|NPropre|Noms propres
N|Abst|Abstrait (ex: bon goût)
N|Conc|Concret (ex: abbaye)
N|ConcColl|Concret collectif (ex: décombres)
N|Hum|Humain (ex: diplomate)
N|HumColl|Humain collectif (ex: vieille garde)
N|Anl|Animal (ex: cheval)
N|AnlColl|Animal collectif (ex: troupeau)
V|t|Verbe transitif (ex: foudroyer)
V|i|Verbe intransitif (ex: fraterniser)
V|en|Particule pré-verbale obligatoire (ex: en imposer)
V|se|Verbe pronominal (ex: se marier)
V|ne|Verbe à négation obligatoire (ex: ne pas cesser de)

### Registres de langue
Cette information est facultative.

Catégorie|Code|Description 
---|---|--- 
\*|z1|langage courant
\*|z2|langage spécialisé
\*|z3|langage très spécialisé ou technique

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

## Sources
Je n'ai pas trouvé de spécifications officielles ou complètes du format DELA, mais l'observation et certaines sources permettent tout de même d'en comprendre partiellement la structure :
* [Manuel d'utilisation d'Unitex - Unitex/GramLab](https://unitexgramlab.org/releases/3.1/man/Unitex-GramLab-3.1-usermanual-fr.pdf) pages 43-48 : la description la plus complète trouvée
* [Utilisation des entrées adverbiales du DELA issues des tables du Lexique-Grammaire du français](https://hal.archives-ouvertes.fr/hal-01443984/) par Elsa Tolone, Stavroula Voyatzi, Claude Martineau : pour une description correcte d'une entrée du DELAF
* [Un système de dictionnaires électroniques pour les mots simples du français](https://www.persee.fr/doc/lfr_0023-8368_1990_num_87_1_6323) : semble correspondre à des versions antérieures à ce qui est diffusé aujourd'hui
* [Documentation des logiciels GramLab > Gramlab IDEling > C - Créer des ressources linguistiques > 5. Manipuler les dictionnaires](https://sites.google.com/site/gramlabdocumentation/gramlab-ide/creer-et-maintenir-des-grammaires/creer-et-utiliser-des-dictionnaires) : pour la syntaxe de premier niveau des variantes fléchies (DELAF) et non (DELAS) d'un dictionnaire DELA.
