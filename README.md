# Icecast
basic Icecast streaming server setup on specified OS

This guide is meant as a basic starting point to setup an Icecast streaming server. With Apple's (and other vendors') requirement for an SSL stream for internet radio stations I had to find other options than a Windows Icecast install. Windows 7 was an acceptable platform to use for Icecast before the SSL requirements, and as a home to previous Shoutcast servers, but getting Windows to work with Icecast and SSL is troublesome at best. If you really want to install Icecast with SSL on Windows all I will say is Stunnel, and good luck figuring out proper logging for SoundExchange/BMI/ASCAP reporting. Support for Icecast on various Linux distributions is much wider, and, considering the upcoming Windows 7 retirement date, Windows 10 doesn't run great on a low resource (Atom D525) machine or VM (1GB RAM 1 CPU core); CentOS and Lubuntu perform very well on such platforms. I personally run Lubuntu installs, but that is simply a preference of Debian over Fedora. Most any flavor can be setup to run Icecast if you're knowledgable with a particular one. This guide will focus on CentOS and Lubuntu installations.

## Starting Notes
1. This guide assumes basic shell knowledge.
2. I'm starting with instructions based on a GUI install. A shell only version is a future project. There aren't many differences aside from the text editor chosen to edit the icecast.xml configuration file. Most everything else is already done in shell only.
3. These instructions will get a basic Icecast server up and running. Proper setup of the icecast.xml configuration file is currently outside the scope of this guide. The latest documentation of Icecast can be found at https://icecast.org/docs/icecast-latest.

## Current OSs - see subfolders for OS specific readme
1. [CentOS](https://github.com/chrishopp/Icecast/tree/master/CentOS7)
2. [Lubuntu](https://github.com/chrishopp/Icecast/tree/master/Lubuntu16LTS)
