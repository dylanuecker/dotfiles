FROM ubuntu:lunar

LABEL description="LibreOffice"

RUN apt-get -yq update && \
	apt-get -yq upgrade && \
	apt-get -yq install \
	less \
    libreoffice \
    sudo

RUN userdel -r ubuntu && \
    useradd libre && \
	mkdir /home/libre && \
	chown libre:libre /home/libre && \
	echo 'libre ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER libre:libre
