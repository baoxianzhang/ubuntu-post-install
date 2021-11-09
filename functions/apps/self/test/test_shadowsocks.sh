#!/bin/bash

# Fancy colorful echo messages
function echo_message(){
	local color=$1;
	local exp=$2;
	if ! [[ $color =~ '^[0-9]$' ]] ; then
		case $(echo -e $color | tr '[:upper:]' '[:lower:]') in
			# 0 = black
			title) color=0 ;;
			# 1 = red
			error) color=1 ;;
			# 2 = green
			info) color=2 ;;
			# 3 = yellow
			warning) color=3 ;;
			# 4 = blue
			question) color=4 ;;
			# 5 = magenta
			success) color=5 ;;
			# 6 = cyan
			header) color=6 ;;
			# 7 = white
			*) color=7 ;;
		esac
	fi
	tput bold;
	tput setaf $color;
	echo $exp;
	tput sgr0;
}

function install_shadowsocks {
 echo_message info "<<<<<< Install Shadwsocks. >>>>>>"
 sudo apt-get install python-pip
 sudo pip install --upgrade git+https://github.com/shadowsocks/shadowsocks.git@master
 wget -c https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz
 tar -xf libsodium-1.0.16.tar.gz
 cd libsodium-1.0.16
 ./configure
 make
 sudo make install
 cd ..
 rm libsodium-1.0.16.tar.gz
 rm libsodium-1.0.16 -rf
 echo_message info "add SwitchyOmega.crx plugin to google chrome"
 echo_message info "in Import/Export restore from file add *.bak and choose auto switch" $green
 echo_message info "chmod +x shadowsock.sh and ./shadowsocks"
}

install_shadowsocks
