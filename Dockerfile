FROM       jlesage/baseimage-gui:ubuntu-18.04

# Wird später für den mediaelch schlüssel gebraucht
RUN apt-get update && apt-get install -y gnupg

# Add MediaElch Repo
RUN echo deb http://ppa.launchpad.net/mediaelch/mediaelch-stable/ubuntu xenial main  >> /etc/apt/sources.list.d/mediaelch.list
RUN echo deb-src http://ppa.launchpad.net/mediaelch/mediaelch-stable/ubuntu xenial main >> /etc/apt/sources.list.d/mediaelch.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com C4FD788F
RUN apt-get update

# Install MediaElch
RUN apt-get install -y mediaelch qtdeclarative5-models-plugin qml-module-qtquick-controls libqt5multimedia5-plugins

# Install nano
RUN apt-get install -y nano

# Create user
RUN adduser --disabled-password --gecos ""  mediaelch

# Entrypoint (biegt den Nutzer um)
COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN apt-get install -y locales
RUN locale-gen de_DE.UTF-8  
RUN update-locale LANG=de_DE.UTF-8
ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de  
ENV LC_ALL de_DE.UTF-8
RUN echo 'export LC_ALL=de_DE.UTF-8' >> /home/mediaelch/.profile
RUN echo 'export LANG=de_DE.UTF-8' >> /home/mediaelch/.profile
RUN echo 'export LANGUAGE=de_DE.UTF-8' >> /home/mediaelch/.profile
RUN echo 'export LC_ALL=de_DE.UTF-8' >> /home/mediaelch/.bashrc
RUN echo 'export LANG=de_DE.UTF-8' >> /home/mediaelch/.bashrc
RUN echo 'export LANGUAGE=de_DE.UTF-8' >> /home/mediaelch/.bashrc

# Set environmet variables
ENV APP_NAME="MediaElch"
ENV APP_USER="mediaelch"
ENV USER_ID=1041
ENV GROUP_ID=100

# Define mountable directories.
VOLUME ["/filme"]
VOLUME ["/serien"]

COPY startapp.sh /startapp.sh

# advancesettings ins Home kopieren. Das wird automatisch durch /etc/cont-init.d/01-copy-advancedsettings.sh an die richtige stelle kopiert
COPY advancedsettings.xml /home/mediaelch/advancedsettings.xml

# MediaElch Settings kopieren. 
COPY MediaElch.conf /config/xdg/config/kvibes/MediaElch.conf

# script: home Verzeihniss auf user umbiegen
COPY 00-take-home-ownership.sh /etc/cont-init.d/00-take-home-ownership.sh
RUN chmod +x /etc/cont-init.d/00-take-home-ownership.sh

# script: Settings kopieren
COPY 01-copy-advancedsettings.sh /etc/cont-init.d/01-copy-advancedsettings.sh
RUN chmod +x /etc/cont-init.d/01-copy-advancedsettings.sh