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
function install_git {
  sudo add-apt-repository ppa:git-core/ppa 
  sudo apt update
  sudo apt install git

  echo_message info 'Configure '$NAME'...'
  git config --global user.email "baoxianzhit@gmail.com"
  git config --global user.name "baoxianzhang"
  git config --global core.editor vim
  git config --global push.default simple
  git config --global alias.unstage "reset HEAD --"
  git config --global alias.last "log -1 HEAD"

  echo_message success "Installation of git complete."
}

install_git
