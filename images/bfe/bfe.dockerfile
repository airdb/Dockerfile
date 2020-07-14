FROM golang:1.13 AS builder

MAINTAINER Copyright @ airdb.com

RUN echo "export PS1='[\H \W]\\$ '" >> /root/.profile
RUN go get -u github.com/bfenetworks/bfe

WORKDIR  /go/src/github.com/bfenetworks/bfe

RUN  cd /go/src/github.com/bfenetworks/bfe && \
    make


FROM golang:1.13
COPY --from=builder /go/src/github.com/bfenetworks/bfe/output /srv/


