# Etapa de build: compila o código Go
FROM golang:1.23 AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o app .

FROM alpine:3.14

WORKDIR /root/

COPY --from=builder /usr/src/app/app .

CMD ["./app"]