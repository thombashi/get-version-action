VERSION := $(shell jq -r '.version' package.json)
TAG := v$(VERSION)

.PHONY: lint
lint:
	npm run-script lint

.PHONY: package
package:
	npm run-script package

.PHONY: test
test:
	npm run-script test

.PHONY: upgrade
upgrade:
	npx npm-check-updates --upgrade --timeout 60000
	npm install

.PHONY: tag
tag:
	git tag $(TAG)

.PHONY: push-tag
push-tag:
	git push origin $(TAG)
