FROM golang:1.21 AS builder

WORKDIR /

COPY . .

RUN go build -o build/wallet cmd/app/main.go

FROM scratch

COPY --from=builder /build .

EXPOSE 8080

ENTRYPOINT ["./wallet"]
