FROM ubuntu

# docker build -t airdb/scf . -f fpm.dockerfile
# docker run --rm -v $(pwd):/srv airdb/scf

WORKDIR /srv
RUN apt-get update && \
	apt-get -y install python-pip && \
	pip install scf

CMD scf configure set --appid $TENCENTCLOUD_APPID \
	--region $TENCENTCLOUD_REGION \
	--secret-id $TENCENTCLOUD_SECRET_ID \
	--secret-key $TENCENTCLOUD_SECRET_KEY &&\
	scf deploy -t template.yaml -f
