mkdir -p $HOME/pactest
mkdir -p $HOME/.cache/pactest
CHROOT=$HOME/pactest

pacman -Q devtools > /dev/null 2>&1

if [ $? == '1' ]; then
    echo 'devtools not installed, installing now'
    sudo pacman -S extra/devtools
else
    echo 'devtools installed'
fi

pacman -Q arch-install-scripts > /dev/null 2>&1

if [ $? == '1' ]; then
    echo 'arch-install-scripts not installed, installing now'
    sudo pacman -S arch-install-scripts
else
    echo 'arch-install-scripts installed'
fi

echo 'Downloading Arch Bootstrap archive. This may take a while'
wget -cq 'https://mirrors.mit.edu/archlinux/iso/2021.04.01/archlinux-bootstrap-2021.04.01-x86_64.tar.gz' -O .cache/pactest/archlinux-bootstrap.tar.gz

ls $CHROOT/etc > /dev/null 2>&1

# if [ $? == '1' ]; then
sudo tar xf .cache/pactest/archlinux-bootstrap.tar.gz -C $CHROOT/ > /dev/null 2>&1
sudo mv $CHROOT/root.x86_64/* $CHROOT/
sudo rm -rf $CHROOT/root.x86_64
chown root:root $CHROOT
# else
#     echo 'chroot already set up'
# fi

echo 'Installing basic packages'

sudo mount --bind /proc $CHROOT/proc
sudo mount --bind /sys $CHROOT/sys
sudo mount --bind /dev $CHROOT/dev 

sudo pacstrap $CHROOT base iputils vim iwd dhcpcd
sudo mount --bind $CHROOT $CHROOT
sudo cp /etc/resolv.conf $CHROOT/etc/
echo 'Entering chroot...'
sudo chroot $CHROOT <<"EOT"
echo 'Server = https://mirror.sfinae.tech/pub/mirrors/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
pacman -Syu

EOT
