.PHONY: html js

SRC = elm
BUILD = docs
HTML = html

build-directory:
	mkdir -p $(BUILD)

build: build-directory html js

html:
	cp $(HTML)/index.html $(BUILD)/index.html
js:
	elm-make $(SRC)/app.elm --output $(BUILD)/app.js

start:
	cd docs;http-server -p 7002 -c10 -o
