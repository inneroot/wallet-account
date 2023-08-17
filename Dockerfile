FROM golang:1.21

COPY . /go/src/app

WORKDIR /go/src/app/cmd/app

RUN go build -o wallet main.go

EXPOSE 8080

CMD ["./wallet"]
