FROM golang:alpine as builder

WORKDIR /app

COPY main/main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o /main main.go

FROM scratch

COPY --from=builder /main /

EXPOSE 8080

CMD ["/main"]git