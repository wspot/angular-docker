.DEFAULT_GOAL := help
.PHONY: install ssh up

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

##
## APP
##---------------------------------------------------------------------------

install:
	docker-compose run node npm install

sh:																						
	docker-compose exec node sh

up:
	COMPOSE_HTTP_TIMEOUT=300 docker-compose up --no-recreate

build:
	docker-compose run node npm run build

lint: 
	docker-compose run node npm run lint