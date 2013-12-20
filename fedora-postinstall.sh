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
#  RPM Fusion
#----------------
rpm -ivh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$VER.noarch.rpm
rpm -ivh http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$VER.noarch.rpm

rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$VER-primary
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$VER-primary

#----------------
# Gnome Stuff
#----------------




