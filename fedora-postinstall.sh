VER=$(cat /etc/fedora-release  |awk '{print $3}')
#----------------
# Immediate Stuff
#----------------

yum install vim gvim gnome-tweak-tool yum-plugin-fastestmirror -y

#----------------
# Update Fedora
#----------------

sudo yum update -y

#----------------
# Add Other OSes
# to grub.
# Make sure HDDs
# are connected!
#----------------

yum install os-prober
##Uncomment when put in a function
#cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.bak
#grub2-mkconfig -o /boot/grub2/grub.cfg


#----------------
# AMD Catalyst
#    Driver
#----------------
yum install gcc kernel-devel kernel-headers wget


#----------------
#  RPM Fusion
#----------------
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$VER.noarch.rpm
rpm -ivh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$VER.noarch.rpm

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$VER-primary
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$VER-primary

#----------------
# Gnome Stuff
#----------------

##Extensions
yum install gnome-shell-extension-common \
            gnome-shell-extension-user-theme \
            gnome-shell-extension-alternate-tab \
            gnome-shell-extension-apps-menu \
            gnome-shell-extension-auto-move-windows \
            gnome-shell-extension-calc \
            gnome-shell-extension-drive-menu \
            gnome-shell-extension-gpaste \
            gnome-shell-extension-launch-new-instance \
            gnome-shell-extension-native-window-placement \
            gnome-shell-extension-places-menu \
            gnome-shell-extension-systemMonitor \
            gnome-shell-extension-weather \
            gnome-shell-extension-window-list \
            gnome-shell-extension-windowsNavigator \
            gnome-shell-extension-workspace-indicator -y

##Themes
yum install gnome-shell-theme-zukitwo gnome-shell-theme-zukiwi -y

#----------------
# Internet Stuff
#----------------

##Flash
rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
yum install flash-plugin -y

##Skype
yum install alsa-lib.i686 libXv.i686 libXScrnSaver.i686 qt.i686 qt-x11.i686 -y

wget http://www.skype.com/go/getskype-linux-beta-fc10
mv getskype-linux-beta-fc10 getskype-linux-beta-fc10.rpm
yum install getskype-linux-beta-fc10.rpm -y
rm -f getskype-linux-beta-fc10.rpm

##Dropbox

##Copy.com

##Chrome


#----------------
# Electronic Lab 
# & Other Tools
#----------------

yum groups install 'Electronic Lab'
