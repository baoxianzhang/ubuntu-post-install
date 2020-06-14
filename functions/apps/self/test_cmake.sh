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

function install_cmake {
  echo_message info 'Downloading '$NAME'...'
  curl -O https://codeload.github.com/Kitware/CMake/zip/master
  # Install package(s)
  echo_message info 'Installing '$NAME'...'
  unzip master
  cd CMake-master
  ./bootstrap --prefix=/usr/local && make -j4
  sudo make install

  # Cleanup and finish
  cd .. # back to the top directory
  rm -rf master
  rm -rf CMake-master
  echo_message success "Installation of cmake complete."
}

install_cmake
