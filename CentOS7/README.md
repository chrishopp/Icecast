# CentOS (centos-release-7.4.1708.e17.centos.x64_64 last tested)
1. Install CentOS 7 with your preffered options
2. Under Software Selection, choose Server with GUI. No additional options are required at this time. Development Tools and other items will be installed with the script. If you wish to install a shell only version you'll need to edit the script to use vi (or your prefered shell text editor) instead of gedit. You'll also need to be familiar with downloading and moving files using only shell commands.
3. Set the root password and create a user. It is not recomended or neccessary that the user have root access. The script does not depend on any specific username. You will need the root password while running the installation script.
4. Navigate the maze to accepting the CentOS EULA.
5. Run an initial system update
```
su -c 'yum -y update'
```
6. Download installicecast.sh file or fetch install script
```
wget https://raw.githubusercontent.com/chrishopp/Icecast/master/CentOS7/installicecast.sh
```
7. Allow executing of file as program
```
chmod +x ./installicecast.sh
```
8. Execute the script
```
./installicecast.sh
```
9. Follow prompts.  
Optional:  
10. Starting Icecast manually from shell
```
icecast -c /usr/local/etc/icecast.xml
```  
Run Icecast in background
```
icecast -b -c /usr/local/etc/icecast.xml
```
11. Run another system update, reboot, start Icecast again and ensure things are still working
```
su -c 'yum -y update'
```

## Useful Extras
### OpenVMTools
```
yum -y install open-vm-tools
```
### SSH Server
```
yum -y install openssh-server
```
### Autostart Icecast on system start using rc.local
```
su root
sudo gedit /etc/rc.d/rc.local
```
Append lines (Replace $USER with desired username.)
```
su -l $USER -c '/usr/local/bin/icecast -c /usr/local/etc/icecast.xml &'
exit 0
```
Ensure file has run permissions
```
chmod +x /etc/rc.d/rc.local
```
### Make sure ethernet enabled on boot
https://wiki.centos.org/FAQ/CentOS7 bullet point 2
