FROM golang:alpine AS build-env
WORKDIR /usr/local/go/src/github.com/pramodk05/push-workflow
COPY . /usr/local/go/src/github.com/pramodk05/push-workflow
RUN go install -ldflags="-w -s"

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=build-env /usr/local/go/bin/push-workflow /bin/push-workflow
CMD ["push-workflow"]

EXPOSE 8500



