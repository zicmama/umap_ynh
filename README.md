# UMap for Yunohost

[![Latest Version](https://img.shields.io/badge/version-_--_-green.svg?style=flat)](https://github.com/YunoHost-Apps/umap_ynh/releases)
[![Status](https://img.shields.io/badge/status-testing-yellow.svg?style=flat)](https://github.com/YunoHost-Apps/umap_ynh/milestones)
[![Dependencies](https://img.shields.io/badge/dependencies-includes-lightgrey.svg?style=flat)](https://github.com/YunoHost-Apps/umap_ynh#dependencies)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://raw.githubusercontent.com/YunoHost-Apps/umap_ynh/master/LICENSE)
[![Yunohost version](https://img.shields.io/badge/yunohost-2.5.6_tested-orange.svg?style=flat)](https://github.com/YunoHost/yunohost)
[![GitHub issues](https://img.shields.io/github/issues/YunoHost-Apps/umap_ynh.svg?style=flat)](https://github.com/YunoHost-Apps/umap_ynh/issues)

## UMap c'est quoi ?

UMap vous permet de créer des cartes avec des couches OpenStreetMap en une minute et de les intégrer dans votre site. Parce que nous pensons que plus d'OSM sera utilisé, plus OSM sera "guéri". Il utilise [django-leaflet-storage](https://github.com/umap-project/django-leaflet-storage) et [Leaflet.Storage](https://github.com/umap-project/Leaflet.Storage), construit sur le dessus de Django et Leaflet.

Source: [UMap](http://wiki.openstreetmap.org/wiki/UMap)

### Installation

`$ sudo yunohost app install https://github.com/YunoHost-Apps/umap_ynh.git`

### Mise à jour

`$ sudo yunohost app upgrade --verbose umap -u https://github.com/YunoHost-Apps/umap_ynh.git`

## What is UMap?

uMap lets you create maps with OpenStreetMap layers in a minute and embed them in your site. Because we think that the more OSM will be used, the more OSM will be ''cured''. It uses [django-leaflet-storage](https://github.com/umap-project/django-leaflet-storage) and [Leaflet.Storage](https://github.com/umap-project/Leaflet.Storage), built on top of Django and Leaflet.

Source: [UMap](http://wiki.openstreetmap.org/wiki/UMap)

### Install

`$ sudo yunohost app install https://github.com/YunoHost-Apps/umap_ynh.git`

### Update

`$ sudo yunohost app upgrade --verbose umap -u https://github.com/YunoHost-Apps/umap_ynh.git`

## TODO

- [x] Add language
- [x] Create scripts remove/upgrade/restore
- [x] Use helper ynh_replace_string
- [x] Add token Github + Bitbucket + Twitter + OSM
- [ ] Fix CI
- [ ] Fix restore