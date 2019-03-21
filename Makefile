docker/run/server:
	docker container rm keywordss-api
	docker run -d -p 8080:8080 --name keywordss-api tea1013/keywordss-api:latest make run
	@echo 'Connect Server port :8080 !!!'

docker/stop/server:
	docker container stop keywordss-api

