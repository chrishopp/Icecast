# Lubuntu (Ubuntu 16.04.4 LTS last tested) (Lubuntu 16.04 LTS)
1. Install Lubuntu with preffered options, see next 2 items.
2. Do not "install third-party software for graphics..." at this time. Required items will be installed with the script.
3. Log in automatically not required, but is ok to use depending on desired security.
4. Run an initial system update
```
sudo apt-get update
sudo apt-get upgrade
```
5. Download installicecast.sh file or fetch install script.
```
wget https://raw.githubusercontent.com/chrishopp/Icecast/master/Lubuntu16LTS/installicecast.sh
```
6. Allow executing of file as program.
```
chmod +x ./installicecast.sh
```
7. Execute the script.
```
./installicecast.sh
```
8. Follow prompts.
## Useful Extras (not completly documented)
### OpenVMTools
```
sudo apt-get install open-vm-tools-desktop
```
### OpenSSH Server (remote access with Putty or similar)
```
sudo apt-get install openssh-server
```
### Notepadqq (alternative text editor, similar to Notepad++ on Windows)
```
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq
```
### Autostart Icecast on system boot using rc.local
```
sudo leafpad /etc/rc.local
```
Append lines (Replace $USER with desired username.)
```
su -l $USER -c '/usr/local/bin/icecast -c /usr/local/etc/icecast.xml &'
exit 0
```
Ensure file has run permissions
```
sudo chmod +x /etc/rc.d/rc.local
```
### Mount network share for icecast logs
```
sudo apt-get install cifs-utils
```
Make nowplaying mountpoint locally (Replace $USER with desired username.)
```
sudo mkdir /mnt/streaminglogs
sudo chown $USER:root /mnt/streaminglogs
sudo chmod 0770 /mnt/streaminglogs
```
Create smbcredentials file
```
sudo leafpad ~/.smbcredentials
```
Make content as follows:
```
username=user
password=password
```
Edit fstab file to automount this location
```
sudo leafpad /etc/fstab
```
Make content as follows (replace $networkaddress with your file server address and $mount with the share folder):
```
//$networkaddress/$mount /mnt/streaminglogs cifs credentials=/home/$USER/.smbcredentials,gid=1000,file_mode=0770,dir_mode=0770,iocharset=utf8 0 0
```
Mount to test things out
```
sudo mount -a
```
### Create rsync file for transfering local icecast logs to a remote directory
```
sudo leafpad /etc/cron.daily/rsynclogs
```
Make file content (replace $stream with channel name and $USER with desired username:
```
#!/bin/sh
d="$(date +"%Y-%m")"
mkdir -p /mnt/streaminglogs/$stream/"$d"
rsync -avvvz --no-perms --exclude=test*.log --exclude=*error.log --exclude=*error.log* /home/$USER/Icecast/logs /mnt/streaminglogs/$stream/"$d"
```
Move rsynclogs (unclear what this was for as of writing, currently untested)
```
sudo chown $USER:root /etc/cron.daily/rsynclogs
sudo chmod +x 0770 /etc/cron.daily/rsynclogs
chmod /etc/cron.daily/rsynclogs
