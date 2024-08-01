DB_USER			= amongus
DB_PASSWORD		= secret
DB_HOST			= localhost
DB_NAME			= amongus_dev
NETWORK			= amongus-dev-network
SSL_MODE		= disable
DB_SOURCE		= postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_NAME}?sslmode=${SSL_MODE}
CONTAINER_NAME	= amongusdb

network:
	docker network create ${NETWORK}

postgres:
	docker run --name ${CONTAINER_NAME} \
			   --network ${NETWORK} \
			   -p 5432:5432 \
			   -e POSTGRES_USER=${DB_USER} \
			   -e POSTGRES_PASSWORD=${DB_PASSWORD} \
			   -d postgres:16-alpine

createdb:
	docker exec -it ${CONTAINER_NAME} createdb \
				--username=${DB_USER} \
				--owner=${DB_USER} ${DB_NAME}

dropdb:
	docker exec -it ${CONTAINER_NAME} dropdb \
				--username=${DB_USER} ${DB_NAME}

migrateup:
	migrate -path db/migration -database ${DB_SOURCE} -verbose up

migratedown:
	migrate -path db/migration -database ${DB_SOURCE} -verbose down

migratedownf:
	migrate -path db/migration -database ${DB_SOURCE} force 1 -verbose down

new_migration:
	migrate create -ext sql -dir db/migrations -seq $@

sqlc:
	sqlc --file configs/sqlc.yaml generate

test:
	go test -v -cover ./...

server:
	go run cmd/amongus/main.go

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test server