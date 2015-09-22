FROM debian:latest 

MAINTAINER thomas ASNAR <thomas.asnar@gmail.com>

RUN apt-get update
RUN apt-get install ksh
RUN mkdir /opt/vtom 
RUN useradd -d /opt/vtom -s /usr/bin/ksh vtom
RUN chown vtom /opt/vtom
RUN mkdir /sources
RUN mkdir /sources/SES

COPY SES /sources/SES/

EXPOSE 30001 30004 30007 30008 30080

ENTRYPOINT ["/bin/bash"]
CMD ["-c","/sources/SES/dockerinit.ksh;/bin/bash"]

