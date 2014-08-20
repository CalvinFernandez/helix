.DEFAULT_GOAL=dist

.PHONY: deps
deps:
	@npm install -g coffee

.PHONY: clean
clean:
	@rm -rf dist

.PHONY: dist
dist: clean
	@mkdir -p dist
	@./node_modules/.bin/browserify -d -t coffeeify src/index.coffee > dist/helix.js
	@coffee -o dist/ -c demo.coffee
