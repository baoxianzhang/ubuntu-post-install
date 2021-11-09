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
function install_zsh {
  echo_message info 'Installing '$NAME'...'
  sudo apt-get install -y zsh
  wget -nc https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
  sudo chsh -s /bin/zsh
  echo_message info "Logout to use zsh"
  echo_message success "Installation of zsh complete."
}



install_zsh
