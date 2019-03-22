FRONT_REPOSITORY_NAME:=hatchgroup/keywordss-front
DB_REPOSITORY_NAME:=hatchgroup/keywordss-db
API_REPOSITORY_NAME:=hatchgroup/keywordss-api

FRONT_CONTAINER_NAME:=keywordss-front
API_CONTAINER_NAME:=keywordss-api
DB_CONTAINER_NAME:=keywordss-db

docker/run/server:
	docker run -d -p 8080:8080 --name keywordss-api $(API_REPOSITORY_NAME):latest
	@echo 'Connect Server port :8080 !!!'

docker/stop/server:
	docker container stop $(API_CONTAINER_NAME)
	docker container rm $(API_CONTAINER_NAME)

image/pull:
	$(MAKE) image/pull/front
	$(MAKE) image/pull/api
	$(MAKE) image/pull/db

image/pull/front:
	docker pull $(FRONT_REPOSITORY_NAME)

image/pull/api:
	docker pull $(API_REPOSITORY_NAME)

image/pull/db:
	docker pull $(DB_REPOSITORY_NAME)

image/rm:
	$(MAKE) image/rm/front
	$(MAKE) image/rm/api
	$(MAKE) image/rm/db

image/rm/front:
	docker image rm -f $(FRONT_REPOSITORY_NAME)

image/rm/api:
	docker image rm -f $(API_REPOSITORY_NAME)

image/rm/db:
	docker image rm -f $(DB_REPOSITORY_NAME)

