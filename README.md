# Inception

Ce repository contiens ma solution au projet `Inception` de 42.

This repository contains my solution to the project `Inception` of 42.

## Description 

Ce projet vise à créer une petite infrastructure sur Docker. Il héberge un serveur wordpress.

This project aims to create a small infrastructure on Docker. It host a wordpress server.

## Using Inception

### Cloning

```shell
git clone https://github.com/Freya-Tenebrae/Inception.git
```

### Using

Vous avez besoin de créer un fichier "env" dans votre dossier Document ("~/Documents/env"). Ce fichier dois contenir les informations suivantes.

You need to create a file named "env" on you'r Domument Directory ("~/Documents/env") containing the following information.

```shell
SQL_USER=""
SQL_PASSWORD=""
SQL_ROOT_PASSWORD=""
SQL_HOST=""
WP_URL=""
WP_TITLE=""
WP_ADMIN=""
WP_ADMIN_PASSWORD=""
WP_ADMIN_EMAIL=""
WP_USR=""
WP_USR_MAIL=""
WP_USR_PASS=""
```

```shell
make
```

Le site met environ 30s après la compilation et le lancement des 3 conteneur pour fonctionner correctement.

the site need around 30s after the compilation and launch of the 3 container to work properly.
