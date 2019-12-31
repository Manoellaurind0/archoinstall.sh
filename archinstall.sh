#!/bin/bash
# vim:ft=sh:nolist:
# Criado em:ter 03/fev/2009 hs 11:39
# Last Change: 05-02-2009 08:21:32
# Proposito do script: preparar o seu arch linux
# Autor: Manoel Bomfim Laurindo
# site:

# OBS: se estive instalando em um computador de 64 bits
# leia sobre libs32 que habilitam suporte a pacotes 32 bits
# no ambiente 64 bits

if  [ "$(id -u)" != "0" ];  then
  echo "  Este script precisa ser executado como root"
  exit  1
fi

LOG="/tmp/install.log"
# cabeçalho
DATA=`date +%d-%m-%Y+%H:%M`

echo "   Script de instalação"
echo "   instalação de programas e codecs"
echo "   script iniciado: "
echo 
echo "   caso deseje usar apenas algumas variáveis do script"
echo "   faça: "
echo "   source $0"
echo "   pressione enter para continuar"
read 

# para não pedir confirmação
alias pacman="pacman --noconfirm"

# Antes de mais nada atualize os mirros
pacman -Syy
pacman -Syu
#install=`pacman -S`

ADMIN="hwd nmap rsync awk openssh tree"

DESKTOP="libgl xorg gnome gnome-extras gdm avahi gtk-engine-murrine gtk-engines alacarte
gtk2-themes-collection gtk-aurora-engine gtk-candido-engine gtk-rezlooks-engine xchm abiword
evince  gnome-icon-theme gtk-engines numlockx openbox obconf obmenu openbox-themes screenlets deluge
xchat xmahjongg unace unrar unzip p7zip zip ttf-dejavu ttf-bitstream-vera ttf-ms-fonts ttf-ms-fonts
alsa alsa-lib alsa-utils alsa-oss hal fam dbus j2re autofs gparted"

PRINT="cups ghostscript gutenprint hplip"

CODECS=`pacman -Ss gstreamer | grep -e '^extra/gstreamer0.10' | awk '{print $1}'`

MEDIA="vlc rhythmbox mplayer mplayer-plugin brasero dvd+rw-tools audacious audacious-plugins"

DEVELOP="subversion vim gvim bash-completion cabextract nano"

WEB="w3m links firefox chromium opera flashplugin mplayer-plugin pidgin pidgin-libnotify
 skype xchat"

OFFICE="openoffice-base openoffice-pt_br openoffice-spell-pt-br abiword gnumeric
 gnome-system-monitor"

GRAPHICS="feh inkscape gimp gnome-specimenxfce4 xfce4-goodies xfce4-terminal"

install (){
echo $DATA
pacman -S $ADMIN $DESKTOP $PRINT $CODECS $MEDIA $DEVELOP $WEB $OFFICE $GRAPHICS
}

install | tee -a $LOG

# após adicionar usuário rode estes comandos
# gpasswd -a login-do-usuario audio
# gpasswd -a login-do-usuario network
# gpasswd -a login-do-usuario optical
# gpasswd -a login-do-usuario storage
# gpasswd -a login-do-usuario dbus
# gpasswd -a login-do-usuario hal
# ou ...
# useradd -m -G users,audio,lp,optical,storage,video,wheel,power,network,dbus,hal -s /bin/bash sergio
# passwd sergio

# texlive
# pacman -S texlive-latex3
# converte midi para wav
# pacman -S extra/timidity++
# para tocar midi
# timidity example.midi

# montagem automática de dispositivos
# http://wiki.archlinux-br.org/Autofs
# http://pognation.wordpress.com/2008/06/04/autofs-no-archlinux/

# página inicial do firefox
# gconftool-2 --direct \
# --config-source xml:readwrite:/etc/opt/gnome/gconf/gconf.xml.mandatory \
# --type string --set /apps/firefox/general/homepage_url "www.google.com"

# from: http://groups.google.com/group/archlinux-br
# Olá Sergio,
# Acho que "--noconfirm      do not ask for any confirmation" faz o que
# você quer. Faça um alias pac='pacman --noconfirm -S', eu tenho alguns
# alias aqui:

#alias paq='sudo pacman -Q | grep'
#alias paql='sudo pacman -Ql'
#alias pac='sudo pacman -S'
#alias pas='sudo pacman -Ss'
#alias pasi='sudo pacman -Si'
#alias pacy='sudo pacman -Sy'

# diganóstico de hardware e administraão do sistema
# http://wiki.archlinux.org/index.php/Cpufrequtils
#pacman -S cpufrequentials

# no caso do ssh adicione as máquinas que quer 
# liberar no /etc/hosts.allow
#sshd: 127.0.0.1
#sshd: 10.1.1.2
#sshd: 10.1.1.5
#sshd: 10.1.1.15

# o pacote libgl é uma recomendação leia:
# http://wiki.archlinux.org/index.php/Beginners_Guide
# dicas sobre o gnome: http://wiki.archlinux-br.org/GNOME
# zeroconf - use o avahi
# permite ao rythminbox compartilhar músicas (plugin)
# e o pidgin comunicar sem servidor (protocolo bonjour)
# fonte: http://wiki.archlinux.org/index.php/Avahi
# java ### como instalar o java
# opção ao java
# pacman -S openjdk

# Referências:
# http://bbs.archlinux.org/viewtopic.php?id=55965
# http://wiki.archlinux.org/index.php/Common_Apps (pacotes)
# http://wiki.archlinux.org/index.php/Table_of_Contents_(English)
