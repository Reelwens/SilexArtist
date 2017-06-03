# Silex artist

Un doute, une question sur la composition des albums du groupe Muse ? Ce site internet les regroupe en libre consultation. Ce projet a été réalisé dans un cadre scolaire en respectant différentes contraintes.

Silex, PHP, les bases de données SQL, CSS, Bootstrap font partie des différentes technologies utilisées.

## Installation

- Importer les tables SQL `silex-artist.sql` via phpmyadmin dans une base de donnée d'interclassement utf8_general_ci
- Modifier selon le besoin : le case, le nom de la base de donnée, le nom d'utilisateur, et le mot de passe d'accès dans le fichier `web\includes\config.php`
- Modifier le RewriteBase dans `web\.htaccess` de sorte à ce qu'il mène au dossier web\
- Executer la commande `composer install` dans le terminal à la racine
- Lancer `web\` à sa racine sur un serveur

## Remarques

* Le site internet est directement consultable en ligne à [cette adresse](https://www.simonlucas.fr/web/silex-artist/web/).

* Le code a été écrit de zéro et au fur et à mesure ces deux dernières semaines, sur un repository [GitHub](https://github.com/Reelwens/silex-artist).

Il respecte les contraintes suivantes :

* Utiliser Silex
* Plusieurs œuvres (musiques)
* Catégories d'œuvres (albums)
* Routes dynamiques avec contraintes
* Contenus dans la base de données
* Jointure SQL (sons <-> albums)
* Aucune notice / warning / error PHP

La base de donnée n'a été entierement remplie que pour les deux premiers albums.

## Fonctionnalités

* Réalisation d'un formulaire de contact fonctionnel
* Page d'erreur
* Style personnalisé
* Entierement responsive
* Utilisation d'un middleware
* Configuration multi-environnementale
* Requêtes SQL sécurisées
* Séparation du code back-end pour une meilleure organisation