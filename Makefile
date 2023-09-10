help:
	@echo ""
	@echo "usage: make COMMAND"
	@echo ""
	@echo "Commands:"
	@echo "  docker-create                Create containers, then start containers and create database"
	@echo "  docker-delete                Destroy containers and database"
	@echo ""
	@echo "  docker-start                 Start containers"
	@echo "  docker-stop                  Stop containers"
	@echo ""
	@echo "  django-migrate               Migrate database to last release"
	@echo ""
	@echo "  shell-python                 Enter python container"
	@echo "  shell-psql                   Enter psql container"
	@echo ""

docker-create:
	@mkdir -p ./data/dumps
	@docker compose build
	@docker compose up -d --wait
	@docker compose exec python /bin/sh -c "python3 /app/manage.py migrate"
	@docker compose down
	@docker compose up -d --wait

docker-delete:
	@docker compose down
	@rm -rf ./data

docker-start:
	@docker compose up -d --wait

docker-stop:
	@docker compose down

django-migrate:
	@docker compose exec python /bin/sh -c "python3 /app/manage.py migrate"

shell-python:
	@docker compose exec -it python /bin/sh

shell-psql:
	@docker compose exec -it psql /bin/sh
