# build stage
FROM golang:1.21-alpine3.18 AS builder
WORKDIR /app
COPY . .
RUN go build -o main cmd/amongus/main.go

# run stage
FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/main .
COPY configs/app.env ./configs/app.env
COPY scripts/start.sh .
COPY scripts/wait-for.sh .
RUN chmod 777 wait-for.sh
COPY db/migrations ./db/migrations

EXPOSE 8080
CMD [ "/app/main" ]
ENTRYPOINT [ "/app/start.sh" ]