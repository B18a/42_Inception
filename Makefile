
NAME = inception
COMPOSE_FILE = src/docker-compose.yml
ENV_FILE = src/.env
DATA = /Users/ajehle/Desktop/42_Inception

up: build
	docker compose -p $(NAME) -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up

build:
	mkdir -p /home/ajehle/data/mariadb
	mkdir -p /home/ajehle/data/wordpress
	mkdir -p /home/ajehle/data/kuma
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) build --no-cache

down:
	docker stop $$(docker ps -qa)

remove:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi

removeall:
	@if [ -n "$$(docker ps -qa)" ]; then docker stop $$(docker ps -qa); fi
	@if [ -n "$$(docker ps -qa)" ]; then docker rm $$(docker ps -qa); fi
	@if [ -n "$$(docker images -qa)" ]; then docker rmi -f $$(docker images -qa); fi
	@if [ -n "$$(docker volume ls -q)" ]; then docker volume rm $$(docker volume ls -q); fi
	@if [ -n "$$(docker network ls -q)" ]; then docker network rm $$(docker network ls -q) 2>/dev/null || true; fi
