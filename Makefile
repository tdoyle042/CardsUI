STYLES=./style/cards-style.scss
SCRIPTS=./js/cards-script.coffee

all:

watch:
	sass --watch $(STYLES)&
	coffee -c -w $(SCRIPTS)
