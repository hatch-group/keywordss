FRONT_REPOSITORY_NAME:=hatchgroup/keywordss-front
DB_REPOSITORY_NAME:=hatchgroup/keywordss-db
API_REPOSITORY_NAME:=hatchgroup/keywordss-api

FRONT_CONTAINER_NAME:=keywordss-front
API_CONTAINER_NAME:=keywordss-api
DB_CONTAINER_NAME:=keywordss-db

#----------------------------------------------------------------------#

docker/run:
	$(MAKE) docker/run/db
	$(MAKE) docker/run/server
	$(MAKE) docker/run/front

docker/run/db:
	docker run -d -p 3306:3306 --name $(DB_CONTAINER_NAME) --env-file _secret/.env $(DB_REPOSITORY_NAME):latest
	@echo 'Connect DB port :3306 !!!'

docker/run/server:
	docker run -d -p 8080:8080 --name $(API_CONTAINER_NAME) --env-file _secret/.env $(API_REPOSITORY_NAME):latest
	@echo 'Connect Server port :8080 !!!'


docker/run/front:
	docker run -d -p 3000:3000 --name $(FRONT_CONTAINER_NAME) $(FRONT_REPOSITORY_NAME):latest
	@echo 'Connect Front port :3000 !!!'

#----------------------------------------------------------------------#

docker/stop:
	$(MAKE) docker/stop/front
	$(MAKE) docker/stop/server
	$(MAKE) docker/stop/db

docker/stop/front:
	docker container stop $(FRONT_CONTAINER_NAME)
	docker container rm $(FRONT_CONTAINER_NAME)

docker/stop/server:
	docker container stop $(API_CONTAINER_NAME)
	docker container rm $(API_CONTAINER_NAME)

docker/stop/db:
	docker container stop $(DB_CONTAINER_NAME)
	docker container rm $(DB_CONTAINER_NAME)

#----------------------------------------------------------------------#

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

#----------------------------------------------------------------------#

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

