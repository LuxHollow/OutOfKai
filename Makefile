.PHONY: build
build:
    docker-compose build
.PHONY: clean
clean:
    rm -f tmp/pids/server.pid
.PHONY: up
up: clean
    docker-compose up
.PHONY: upd
upd: clean
    docker-compose up -d
.PHONY: down
down:
    docker-compose down
.PHONY: downv
downv:
    docker-compose down -v
.PHONY: bundle
bundle:
    docker-compose run --rm app bundle
.PHONY: routes
routes:
    docker-compose run --rm app rails routes
.PHONY: c
c:
    docker-compose run --rm app bin/rails c
.PHONY: logs
logs:
    docker-compose logs -f
.PHONY: sh
sh:
    docker-compose run --rm app sh
.PHONY: dbreset
dbreset:
    docker-compose run --rm app rails db:drop
    docker-compose run --rm app rails db:create
.PHONY: dbinit
dbinit: dbreset migrate
    docker-compose run --rm app rails db:seed
    docker-compose run --rm app rails db:seed_fu
.PHONY: migrate
migrate:
    docker-compose run --rm app rails db:migrate
.PHONY: init
init: downv build bundle dbinit
.PHONY: restore
restore:
    pg_restore --clean --no-acl -h 127.0.0.1 -p 5439 -U postgres -d app_development staging.dump
    docker-compose run --rm app rails db:environment:set RAILS_ENV=development
    docker-compose run --rm app rails db:migrate
