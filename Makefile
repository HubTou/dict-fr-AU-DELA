# Default action is to show this help message:
.help:
	@echo "Possible targets:"
	@echo "  package        Build package"
	@echo "  upload-test    Upload the package to TestPyPi"
	@echo "  upload         Upload the package to PyPi"
	@echo "  clean          Remove all downloaded files"
	@echo "  distclean      Remove all generated files as well"

dict-fr-AU-DELA:
	@echo "=> Producing the full dictionary"
	@( cd data ; cat expressions/* mots/* noms/* verbes/* | sort | sed -e "s/\([-,.]\)/\\\\\1/g" -e "s/|/,/" -e "s/|/./" > dict-fr-AU-DELA )
	@( cd data ; sed -e "s/\\\\,/~/g" -e "s/,/	/g" -e "s/~/,/g" -e "s/\\\\//g" dict-fr-AU-DELA > dict-fr-AU-DELA.tmp )
	@( cd data ; cut -f1 dict-fr-AU-DELA.tmp | sort | uniq | tee dict-fr-AU-DELA.unicode | unicode2ascii | sort | uniq > dict-fr-AU-DELA.ascii )
	@( cd data ; cat dict-fr-AU-DELA.unicode dict-fr-AU-DELA.ascii | sort | uniq > dict-fr-AU-DELA.combined )
	@echo "=> Producing the proper nouns dictionaries"
	@( cd data ; grep "+NPropre" dict-fr-AU-DELA.tmp | cut -f1 | sort | uniq | tee dict-fr-AU-DELA-proper_nouns.unicode | unicode2ascii | sort | uniq > dict-fr-AU-DELA-proper_nouns.ascii )
	@( cd data ; cat dict-fr-AU-DELA-proper_nouns.unicode dict-fr-AU-DELA-proper_nouns.ascii | sort | uniq > dict-fr-AU-DELA-proper_nouns.combined )
	@echo "=> Producing the common compound words dictionaries"
	@( cd data ; grep -v "+NPropre" dict-fr-AU-DELA.tmp | cut -f1 | sort | uniq > dict-fr-AU-DELA.tmp2 )
	@( cd data ; grep " " dict-fr-AU-DELA.tmp2 | tee dict-fr-AU-DELA-common-compound_words.unicode | unicode2ascii | sort | uniq > dict-fr-AU-DELA-common-compound_words.ascii)
	@( cd data ; cat dict-fr-AU-DELA-common-compound_words.unicode dict-fr-AU-DELA-common-compound_words.ascii | sort | uniq > dict-fr-AU-DELA-common-compound_words.combined )
	@echo "=> Producing the common words dictionaries"
	@( cd data ; grep -v " " dict-fr-AU-DELA.tmp2 | tee dict-fr-AU-DELA-common-words.unicode | unicode2ascii | sort | uniq > dict-fr-AU-DELA-common-words.ascii)
	@( cd data ; cat dict-fr-AU-DELA-common-words.unicode dict-fr-AU-DELA-common-words.ascii | sort | uniq > dict-fr-AU-DELA-common-words.combined )

love:
	@echo "Not war!"

package: dict-fr-AU-DELA clean
	python -m build

upload-test:
	python -m twine upload --repository testpypi dist/*

upload:
	python -m twine upload dist/*

clean:
	@echo "=> Removing intermediate files"
	@( cd data ; rm -f *tmp* )

distclean: clean
	@echo "=> Removing generated files"
	@( cd data ; rm -f dict-fr-AU-DELA *ascii *unicode *combined )
	@rm -rf build dist *.egg-info

