COFFEE = './node_modules/.bin/coffee'
JASMINE = './node_modules/.bin/jasmine-node'

.PHONY : init clean build test dist publish

init:
	npm install

clean:
	rm -rf lib/ test/*.js

build:
	${COFFEE} -o lib/ -c src/

test/gol.js:
	${COFFEE} -c test/gol_spec.coffee

test: test/gol.js
	${JASMINE} test/gol_spec.js

dist: clean init build test

publish: dist
	npm publish
