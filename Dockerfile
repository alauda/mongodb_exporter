FROM golang:1.14

LABEL maintainer="Meik Minks <mminks@inoxio.de>"

WORKDIR /go/src/github.com/percona/mongodb_exporter

COPY . .

RUN make build

FROM build-harbor.alauda.cn/ops/alpine:3.15

LABEL maintainer="Alexey Palazhchenko <alexey.palazhchenko@percona.com>"

COPY --from=0 /go/src/github.com/percona/mongodb_exporter/mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

ENTRYPOINT [ "/bin/mongodb_exporter" ]
