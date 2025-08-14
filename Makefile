NAME = inception
COMPOSE = docker compose -f docker-compose.yml

all: up

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

logs:
	$(COMPOSE) logs -f

clean: down
	docker rmi -f $$(docker image ls -q)
	docker volume rm $$(docker volume ls -q | grep $(NAME) || true)
	docker system prune -f

re: clean build up

.PHONY: all build up down logs clean re
