# On se base sur l'image de la dernière debian
FROM debian:latest 

MAINTAINER thomas ASNAR <thomas.asnar@gmail.com>

# L'installation de VTOM nécessite ksh
RUN export http_proxy="http://DOM\\B0002171:mdp@proxy:8080"
RUN export https_proxy="http://DOM\\B0002171:mdp@proxy:8080"
RUN echo 'Acquire::http::proxy "http://DOM\\B0002171:mdp@proxy:8080";' >> /etc/apt/apt.conf.d/proxyPerso.conf
RUN apt-get update
RUN apt-get install -y ksh
RUN apt-get install -y ssh 
RUN apt-get install -y git 
RUN apt-get install -y vim 

# On créé le répertoire d'installation de VTOM
RUN mkdir /opt/vtom 
# On créé le user d'administration vtom
RUN useradd -d /opt/vtom -s /usr/bin/ksh vtom
RUN chown vtom /opt/vtom

# On prépare les répertoires pour acceuilir les sources d'installation de VTOM
RUN mkdir /sources
RUN mkdir /sources/SES

# On copie les fichiers du repo dans SES/
COPY SES /sources/SES/

# 
ENTRYPOINT ["/bin/bash"]

