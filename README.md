# UMap for Yunohost

## UMap c'est quoi ?

UMap vous permet de créer des cartes avec des couches OpenStreetMap en une minute et de les intégrer dans votre site. Parce que nous pensons que plus d'OSM sera utilisé, plus OSM sera "guéri". Il utilise [django-leaflet-storage](https://github.com/umap-project/django-leaflet-storage) et [Leaflet.Storage](https://github.com/umap-project/Leaflet.Storage), construit sur le dessus de Django et Leaflet.

Source: [UMap](http://wiki.openstreetmap.org/wiki/UMap)

### Installation

`$ sudo yunohost app install https://github.com/YunoHost-Apps/umap_ynh.git`

### Mise à jour

`$ sudo yunohost app upgrade --verbose umap -u https://github.com/YunoHost-Apps/umap_ynh.git`

### Recommendation

Dans la [documentation de mise à jour](https://github.com/PrivateBin/PrivateBin/wiki/Configuration#zerobincompatibility) de Parsebin, il est précisé que :

> Pour une compatibilité totale avec ZeroBin et pour pouvoir décrypter les anciennes données, vous autoriseriez cette option. Cependant, cela n'est pas recommandé pour les nouvelles installations car cela affaiblit la sécurité de votre instance PrivateBin.

Ce qui veut dire que nous avons pris le parti de supprimer le répertoire qui permet de sauvegarder les données. Vous pouvez sauvegarder le répertoire 'data', si vous souhaitez concerver vos données. Mais vous devez savoir que celà affaibli la sécurité de cette application.

## What is UMap?

uMap lets you create maps with OpenStreetMap layers in a minute and embed them in your site. Because we think that the more OSM will be used, the more OSM will be ''cured''. It uses [django-leaflet-storage](https://github.com/umap-project/django-leaflet-storage) and [Leaflet.Storage](https://github.com/umap-project/Leaflet.Storage), built on top of Django and Leaflet.

Source: [UMap](http://wiki.openstreetmap.org/wiki/UMap)

### Install

`$ sudo yunohost app install https://github.com/YunoHost-Apps/umap_ynh.git`

### Update

`$ sudo yunohost app upgrade --verbose umap -u https://github.com/YunoHost-Apps/umap_ynh.git`

## TODO

[x] Add language
[] Use helper ynh_replace_string
[] Create scripts remove/upgrade/restore
[] Add token Github + Bitbucket + Twitter + OSM