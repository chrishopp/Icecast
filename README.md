# Icecast
basic Icecast streaming server setup on specified OS

This guide is meant as a basic starting point to setup an Icecast streaming server. With Apple's (and other vendors') requirement for an SSL stream for internet radio stations I had to find other options than a Windows Icecast install. Windows 7 was an acceptable platform to use for Icecast before the SSL requirements, and as a home to previous Shoutcast servers, but getting Windows to work with Icecast and SSL is troublesome at best. If you really want to install Icecast with SSL on Windows all I will say is Stunnel, and good luck figuring out proper logging for SoundExchange/BMI/ASCAP reporting. Support for Icecast on various Linux distributions is much wider, and, considering the upcoming Windows 7 retirement date, Windows 10 doesn't run great on a low resource (Atom D525) machine or VM (1GB RAM 1 CPU core); CentOS and Lubuntu perform very well on such platforms. I personally run Lubuntu installs, but that is simply a preference of Debian over Fedora. Most any flavor can be setup to run Icecast if you're knowledgable with a particular one. This guide will focus on CentOS and Lubuntu installations.

Starting Notes
---------------------------------------------------------------------
1. This guide assumes basic shell knowledge.
2. I'm starting with instructions based on a GUI install. A shell only version is a future project. There aren't many differences aside from the text editor chosen to edit the icecast.xml configuration file. Most everything else is already done in shell only.
3. These instructions will get a basic Icecast server up and running. Proper setup of the icecast.xml configuration file is currently outside the scope of this guide. The latest documentation of Icecast can be found at https://icecast.org/docs/icecast-latest.

CentOS (centos-release-7.4.1708.e17.centos.x64_64 last tested)
---------------------------------------------------------------------
1. Install CentOS 7 with your preffered options  
  a. Under Software Selection, choose Server with GUI. No additional options are required at this time. Development Tools and other items will be installed with the script. If you wish to install a shell only version you'll need to edit the script to use vi (or your prefered shell text editor) instead of gedit. You'll also need to be familiar with downloading and moving files using only shell commands.  
  b. Set the root password and create a user. It is not recomended or neccessary that the user have root access. The script does not depend on any specific username. You will need the root password while running the installation script.  
  c. Navigate the maze to accepting the CentOS EULA.  
  d. Run an initial system update, # su -c 'yum update'  
  e. Download installicecast.sh file or fetch install script, # wget https://raw.githubusercontent.com/chrishopp/Icecast/master/CentOS7/installicecast.sh  
  f. Allow executing of file as program, # chmod +x installicecast.sh  
  g. Execute the script, # ./installicecast.sh  
  h. Follow prompts.
