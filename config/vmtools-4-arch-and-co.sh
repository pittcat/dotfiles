#!/bin/bash
#
# Script:  vmtools-4-arch-and-co.sh
# Date:    july 31, 2013
# Release: v1 - multi arch distros
# Author:  Fnux
# e-mail:  fnux.fl@gmail.com
# Licence: CC-By-Sa
#
# Credit: WoodyZ from communities.vmware.com for his help.
#
clear
echo -e "\033[01;34mHello \033[01;31m$USER\033[01;34m,"
echo ""
if [ "$USER" != "root" ]
  then
    echo -e "\033[01;31mThis script must be used with the root priviledges.\033[01;34m"
    echo ""
    echo "Please restart it using the command: sudo ./install-vmtools.sh"
    echo ""
    echo -e "Goodbye.\033[0m"
    echo ""
    exit 0
fi
echo -e "\033[01;34mThis script will install the VMware Tools on Manjaro, ArchLinux or Bridge guest."
echo ""
echo -e "The benefit of installing the vmware tools on your guest are:"
echo ""
echo -e "- not being anymore obliged to hit \033[01;31m[Ctrl][Alt] \033[01;34mto give the focus to the host"
echo -e "  (just click on the desktop to give it the focus back),"
echo ""
echo -e "- being able to perform \033[01;31mcopy-past\033[01;34m from the host to the guest and vice versa,"
echo ""
echo -e "- being able to perform \033[01;31mdrag-drop\033[01;34m from the host to the guest and vice versa,"
echo ""
echo -e "- using the vmware video driver that allows 3D acceleration and avoids running"
echo -e "  in video software mode that's slow and consumes a lot of CPU."
echo -e "\033[01;33m"
read -p "Please press [Enter] when you're ready. " READY
echo -e "\033[0m"
sleep 3
pacman -S --noconfirm base-devel net-tools xf86-input-vmmouse xf86-video-vmware svga-dri gtkmm
echo ""
echo -e "\033[01;34mIf the install asks to select a linux-headers provider, please select the"
echo -e "option \033[01;31mmatching your kernel version\033[01;34m and press \033[01;31m[Enter]\033[01;34m to install the right"
echo -e "version of the linux-headers."
echo ""
echo "If you don't know your kernel version, open a new termial and start"
echo -e "the command: \033[01;37muname -r\033[01;34m"
echo ""
echo -e "Otherwise, just press \033[01;31m[Enter]\033[01;34m to continue.\033[01;33m"
echo ""
read -p "Please press [Enter] when you're ready. " READY
echo -e "\033[0m"
pacman -S linux-headers # if asked, select the option #4 for the linux39-headers version to install
cd /lib/modules/$(uname -r)/build/include/linux
ln -sv ../generated/uapi/linux/version.h
for x in {0..6}; do mkdir -pv /etc/init.d/rc$x.d; done
echo ""
echo -e "\033[01;34mNow, please press \033[01;31m[Ctrl][Alt]\033[01;34m to return to the host."
echo ""
echo -e "Then select the option \033[01;31m\"Install VMware Tools\"\033[01;34m of the \033[01;31mVM menu\033[01;34m, and once the"
echo -e "VMware Tools CD is mounted into your guest, click back inside your guest.\033[01;33m"
echo ""
read -p "Please press [Enter] when the VMware Tools CD is mounted. " READY
echo -e "\033[0m"
mount /dev/cdrom /mnt
cd /root
tar zxf /mnt/VMwareTools*.tar.gz
cd vmware-tools-distrib
echo ""
echo -e "\033[01;34mNow just press \033[01;31m[Enter]\033[01;34m to respond to all the questions."
echo ""
echo "But if the install can't find the kernel-header path and ask you if you want " 
echo -e "to change its path, just say \033[01;31mNo\033[01;34m to that specific question and continue to"
echo -e "press \033[01;31m[Enter]\033[01;34m to respond to all the other questions up to the end.\033[0m"
echo ""
./vmware-install.pl
echo "Section \"Device\"" > /etc/X11/xorg.conf.d/20-gpudriver.conf
echo "        Identifier \"Card0\"" >> /etc/X11/xorg.conf.d/20-gpudriver.conf
echo "        Driver     \"vmware\"" >> /etc/X11/xorg.conf.d/20-gpudriver.conf
echo "EndSection" >> /etc/X11/xorg.conf.d/20-gpudriver.conf
echo "VM_DRAG_AND_DROP=\"yes\"" > /etc/conf.d/open-vm-tools
/usr/bin/vmware-user
echo ""
echo -e "\033[01;34mNow you're done."
echo ""
echo "You should reboot your OS to enjoy using the new capabilities of your guest."
echo ""
echo "However, after rebooting, you'll have to change your display resolution."
echo -e "\033[01;33m"
read -p "Do you want to reboot your system: y/N [Default = No] ?" RESTARTOS
if [ "$RESTARTOS" = "y" ] || [ "$RESTARTOS" = "Y" ]
  then
    echo -e "\033[01;34m"
    echo "Goodbye."
    echo -e "\033[0m"
    shutdown -r 1
else
    echo -e "\033[01;34m"
    echo "Please reboot your OS to enable the vmware tools."
    echo "Goodbye."
    echo -e "\033[0m"
    exit 0
fi

