docker/run/server:
	docker container rm keywordss-api
	docker run -d -p 8080:8080 --name keywordss-api tea1013/keywordss-api:latest make run
	@echo 'Connect Server port :8080 !!!'

docker/stop/server:
	docker container stop keywordss-api

image/pull:
	$(MAKE) image/pull/front
	$(MAKE) image/pull/api
	$(MAKE) image/pull/db

image/pull/front:
	docker pull shoichi1023/keywordss-front

image/pull/api:
	docker pull tea1013/keywordss-api

image/pull/db:
	docker pull shoichi1023/mysql-mecab-parser

image/rm:
	$(MAKE) image/rm/front
	$(MAKE) image/rm/api
	$(MAKE) image/rm/db

image/rm/front:
	docker image rm -f shoichi1023/keywordss-front

image/rm/api:
	docker image rm -f tea1013/keywordss-api

image/rm/db:
	docker image rm -f shoichi1023/mysql-mecab-parser

