FROM golang

# docker build -t airdb/serverless . -f serverless.dockerfile
# docker run --rm --env-file ~/.env -v $(pwd):/srv airdb/scf

ENV PYTHONUNBUFFERED=1

WORKDIR /srv

RUN echo "**** install serverless ****" && \
	curl -o- -L https://slss.io/install | bash
