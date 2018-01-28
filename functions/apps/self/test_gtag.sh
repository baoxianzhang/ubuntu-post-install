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

# Download function for ease of reuse
function install_gtag {
  echo_message info 'Installing '$NAME'...'
  wget -nc http://tamacom.com/global/global-6.5.5.tar.gz
  tar -xzvf global-6.5.5.tar.gz
  cd global-6.5.5
  sudo apt-get install -y libsdl1.2-dev
  sudo apt-get install -y ncurses-bin
  sudo apt-get install -y libncurses5-dev
  ./configure
  make
  sudo make install
  # clean
  cd ..
  rm global-6.5.5 -rf
  rm global-6.5.5.tar.gz
  echo_message success "Installation of gtag complete."
}

install_gtag
