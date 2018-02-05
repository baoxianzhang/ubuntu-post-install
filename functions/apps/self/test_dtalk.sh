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

function install_dtalk {
  echo_message info 'Downloading dtalk ...'
  wget -c https://raw.githubusercontent.com/duguxiao815/yunCms/215bc498a973c602a5589ffae8bcabc71b726591/dtalk.deb

  # Install package(s)
  echo_message info 'Installing dtalk ...'
  sudo dpkg -i dtalk.deb

  # Cleanup and finish
  rm -rf dtalk.deb
  echo_message success "Installation of dtalk complete."
}

install_dtalk
