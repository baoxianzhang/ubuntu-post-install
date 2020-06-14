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

function install_autojump {
  echo_message info 'Installing '$NAME'...'
  wget -nc https://github.com/downloads/joelthelion/autojump/autojump_v21.1.2.tar.gz
  tar -xzvf autojump_v21.1.2.tar.gz
  cd autojump_v21.1.2
  ./install.sh

  # clean
  cd ..
  rm -rf autojump_v21.1.2
  rm -rf autojump_v21.1.2.tar.gz
  echo_message success "Installation of autojump complete."
}

install_autojump
