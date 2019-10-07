#!/bin/bash
echo "Note, this install process should be run under the user account you wish to run the Icecast process as. Icecast should not be run as sudo or root user."
echo "Please confirm $USER is the user you wish to run Icecast with."
select yn in "Yes" "No"; do
	case $yn in
		Yes ) echo "Icecast will proceed to be installed under user $USER";
		break;;
		No ) echo "Please switch users and attempt install again. Exiting process."; exit;;
	esac
done
mkdir /home/$USER/Icecast
mkdir /home/$USER/Icecast/logs
cd /home/$USER/Icecast
wget http://downloads.xiph.org/releases/icecast/icecast-2.4.4.tar.gz
tar xvf icecast-2.4.4.tar.gz
cd icecast-2.4.4
echo "Please enter the root password to install Icecast dependency packages."
sudo apt-get -y install libcurl4-openssl-dev libxslt1-dev libxml2-dev libogg-dev libvorbis-dev libflac-dev libtheora-dev libssl-dev build-essential
./configure --with-curl --with-openssl --with-vorbis --with-ogg
sudo make
sudo make install
oldlogdir="<logdir>/usr/local/var/log/icecast</logdir>"
newlogdir="<logdir>/home/$USER/Icecast/logs</logdir>"
echo "Setting default Icecast log directory to /home/$USER/Icecast/logs"
sudo sed -i "s@${oldlogdir}@${newlogdir}@" /usr/local/etc/icecast.xml
echo "Would you like to  open the default Icecast ports of 8000 and 8443 in the firewall?"
select yn in "Yes" "No"; do
	case $yn in
		Yes ) sudo ufw allow 8000/tcp
			sudo ufw allow 8443/tcp; break;;
		No ) echo "You will need to modify the firewall later."; break;;
	esac
done
echo "Would you like to edit the icecast config file as root user now?"
echo "At minimum you should change the source, relay, and admin passwords."
select yn in "Yes" "No"; do
	case $yn in
		Yes ) sudo leafpad /usr/local/etc/icecast.xml; break;;
		No ) echo "The default icecast.xml configuration file is located in /usr/local/etc/icecast.xml."; break;;
	esac
done

echo "Select one of the following:"
select finalopt in "Run Icecast now in this terminal" "Run Icecast now in the background" "End installation without running Icecast";
do
	case $finalopt in
		"Run Icecast now in this terminal")
			icecast -c /usr/local/etc/icecast.xml; break;;
		"Run Icecast now in the background")
			icecast -b -c /usr/local/etc/icecast.xml; break;;
		"End installation without running Icecast")
			echo "Happy casting!"; break;;
	esac
done
