FROM golang

# docker build -t airdb/serverless . -f serverless.dockerfile
# docker run --rm --env-file ~/.env -v $(pwd):/srv airdb/scf

ENV PYTHONUNBUFFERED=1

WORKDIR ${GOPATH}/src/airdb.io/airdb

RUN apt update && apt install -y \
	curl \
	git \
	vim && \
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.33.0


RUN echo "**** install serverless ****" && \
	curl -o- -L https://slss.io/install | bash
