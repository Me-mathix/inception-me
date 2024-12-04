#!/bin/bash

# Définir la racine du projet
root="./srcs/requirements"

# Création des dossiers principaux
mkdir -p "$root"/{bonus,mariadb,nginx,tools,wordpress}

# Création des sous-dossiers et fichiers pour mariadb
mkdir -p "$root/mariadb"/{conf,tools}
touch "$root/mariadb/Dockerfile" "$root/mariadb/.dockerignore"

# Création des sous-dossiers et fichiers pour nginx
mkdir -p "$root/nginx"/{conf,tools}
touch "$root/nginx/Dockerfile" "$root/nginx/.dockerignore"

# Création des sous-dossiers et fichiers pour wordpress
mkdir -p "$root/wordpress"/{conf,tools}
touch "$root/wordpress/Dockerfile" "$root/wordpress/.dockerignore"

# Création des sous-dossiers pour tools (si nécessaire, exemple vide)
mkdir -p "$root/tools"

# Ajouter un message de confirmation
echo "Structure créée avec succès dans $root"
