
.PHONY: build generate-resume

buildCommand = hugo --gc --minify
ifdef DEPLOY_PRIME_URL
buildCommand += --buildFuture -b ${DEPLOY_PRIME_URL}
endif
build: generate-resume
	cd site && $(buildCommand)

generate-resume:
	cd resume && npm install && npm run build
	cp resume/docs/ site/content/resume -r