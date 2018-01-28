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

function install_sogou {
  echo_message info 'Downloading '$NAME'...'
  sudo apt-get install fcitx
  sudo apt-get -f install
  wget -O sogoupinyin_amd64.deb http://cdn2.ime.sogou.com/dl/index/1509619794/sogoupinyin_2.2.0.0102_amd64.deb\?st\=MSv-W3DzFHp2LKX-AzRtAw\&e\=1516781430\&fn\=sogoupinyin_2.2.0.0102_amd64.deb
  # Install package(s)
  echo_message info 'Installing '$NAME'...'
  sudo dpkg -i sogoupinyin_amd64.deb

  # Cleanup and finish
  rm -rf sogoupinyin_amd64.deb
  echo_message success "Installation of sogou complete."
}

install_sogou
