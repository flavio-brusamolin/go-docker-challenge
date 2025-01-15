# Etapa de build: compila o código Go
FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -ldflags="-s -w" -o app .

FROM scratch

WORKDIR /root/

COPY --from=builder /usr/src/app/app .

CMD ["./app"]