# Docker_VTOM

Pour faire simple, Docker va me permettre de déployer un serveur VTOM de test pour mes scripts.

Docker se base sur une image qui va être montée en r/o (dans mon cas une debian)
Puis, lors qu'on RUN l'image, il monte une surcouche UnionFS en r/w.
Le tout, monté, s'appelle un conteneur.

Le conteneur n'est autre qu'un OS avec l'application qu'on aura déployée dessus.

Lorsqu'on quittera le conteneur, tout le travail effectué aura disparu. 
Plusieurs solutions si on veut garder les modifications :
* si c'est propre à l'OS ou de la configuration applicative, on va valider notre conteneur (commit) pour en faire une image
* si c'est plus pour sauvegarder et utiliser des fichiers, on va créer un dossier partagé entre le host et l'image. On peut aussi partager des volumes entre les conteneurs avec les [Data Volumes](https://docs.docker.com/userguide/dockervolumes)
 

1. First things firt - Installation de Docker
[Installation Docker](https://docs.docker.com/installation)
En gros, soit on installe Docker engine sur un linux, soit on installe [Docker ToolBox](https://www.docker.com/toolbox) sur Windows. Cela dit, il ne fait qu'installer Virtualbox avec une mini VM Linux avec Docker installé dessus.

2. Clone de ce repo dans votre répertoire 
`git clone git@github.com:thomas-asnar/Docker_VTOM.git`

3. Ajout de vos sources d'installation SERVEUR + CLIENT VTOM dans le répertoire SES
Copier simplement les sources VT-SES-<votre OS, votre version> et VT-CS-<votre OS, votre version> depuis votre CD-ROM VTOM vers le répertoire SES/ clôné.
Au besoin, modifier le script SES/dockerinit.ksh 

4. Paramétrer le fichier Dockerfile ainsi que le install_vtom.ini comme on le souhaite 
J'ai mis des options et des paths par défaut d'installation de VTOM. Il suffit d'ouvrir ces deux fichiers Dockerfile et install_vtom.ini pour comprendre.

5. Build de l'image
`docker build /path/du/gitclone`

6. Run de l'image
On récupère l'ID de l'image créée (si on veut conserver l'image, on fera un `docker tag IDimage <nouveau nom d'image>`

`docker images`

et on lance l'image (en mode tty)

`docker run -it IDimage`


