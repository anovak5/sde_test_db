#!/bin/bash
docker pull postgres
docker run --rm -d --name mypostgres -p 5432:5432 -e POSTGRES_USER=test_sde -e POSTGRES_PASSWORD=@sde_password012 -e POSTGRES_DB=demo -e PGDATA=/var/lib/postgresql/pgdata -v C:\Users\anovak\IdeaProjects\git_ex\sde_test_db\sql:/var/lib/postgresql/data postgres
docker exec -it mypostgres psql -d demo -U test_sde -f /var/lib/postgresql/data/init_db/demo.sql
