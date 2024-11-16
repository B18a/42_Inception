
NAME = inception
COMPOSE_FILE = src/docker-compose.yml
ENV_FILE = src/.env
DATA = /Users/ajehle/Desktop/42_Inception

up:
	docker-compose -p $(NAME) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up

upd:
	docker-compose -p $(NAME) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

build:
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build

down:
	docker stop nginx
	docker stop mariadb
	docker stop wordpress
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down
# docker stop $$(docker ps -qa)

logs:
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) logs -f wordpress

remove:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	docker rm adminer
#	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
#	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
#	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi

removeall:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi
