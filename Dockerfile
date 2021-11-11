FROM golang:alpine AS builder

WORKDIR /app

COPY fullcycle-rocks.go .

RUN go build fullcycle-rocks.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/fullcycle-rocks .

CMD ["./fullcycle-rocks"]