FROM ubuntu

RUN apt-get update \
	apt-get install python-pip \
	pip install scf
