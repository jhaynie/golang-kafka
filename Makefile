NS = jhaynie
REPO = golang-kafka
NAME = golang-kafka
LABEL := latest

.PHONY: build shell rm

build:
	docker build $(OPTS) -t $(NS)/$(REPO):$(LABEL) .

shell:
	docker run $(OPTS) --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO) /bin/bash

publish:
	docker push $(NS)/$(REPO):$(LABEL)

rm:
	docker rm $(OPTS) $(NAME)

default: build
