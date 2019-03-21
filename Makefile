docker/run/server:
	docker run -d -p 8080:8080 --name keywordss-api hatchgroup/keywordss-api:latest make run
	@echo 'Connect Server port :8080 !!!'

docker/stop/server:
	docker container stop keywordss-api
	docker container rm keywordss-api

image/pull:
	$(MAKE) image/pull/front
	$(MAKE) image/pull/api
	$(MAKE) image/pull/db

image/pull/front:
	docker pull hatchgroup/keywordss-front

image/pull/api:
	docker pull hatchgroup/keywordss-api

image/pull/db:
	docker pull hatchgroup/keywordss-db

image/rm:
	$(MAKE) image/rm/front
	$(MAKE) image/rm/api
	$(MAKE) image/rm/db

image/rm/front:
	docker image rm -f hatchgroup/keywordss-front

image/rm/api:
	docker image rm -f hatchgroup/keywordss-api

image/rm/db:
	docker image rm -f hatchgroup/keywordss-db

