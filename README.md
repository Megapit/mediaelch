# megapit:mediaelch
### MediaElch 2.6.0 - Ferenginar (2019-01-06) Deutsch

##### Docker-Container wurde "nur" auf Synology DSM 6.2 getestet, sollte aber auch woanders laufen.

### Credits:
* MediaElch [http://www.kvibes.de/mediaelch/]()  
* Vorlage Docker-Container [https://github.com/odon/docker-mediaelch]()  
* Base-Image [https://github.com/jlesage/docker-baseimage-gui]()  

### Ports  
HTTP (noVNC) Port 5800  
VNC	 Port 5900  

### Exportierte Volumes  
/filme   -> zum sharen des Filme Ordners  
/serien  -> zum sharen des Serien Ordners  

### User / Group Identifiers
Der Benutzer sollte unter "*USER_ID*" und "*GROUP_ID*" an die Synology angepasst werden.  
Mit "id *username*" kann das ganz einfach auf der Synology ausgelesen werden.  

### /home/mediaelch/advancedsettings.xml<br>
In dieser Datei wurden einige Einstellungen vorgenommen. Auf eingene Wünsche anpassen!!!  
Beim Systemstart wird diese Datei nach /config/xdg/data/kvibes/MediaElch kopiert.  
Also eigene Änderungen am besten in /home/mediaelch/advancedsettings.xml machen und den Container neu starten.  
