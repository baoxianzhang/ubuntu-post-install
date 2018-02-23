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

function install_libpointmatcher {
  echo_message info 'Downloading and installing libnano ...'
  wget -c https://codeload.github.com/ethz-asl/libnabo/zip/master
  unzip master
  rm master
  cd libnabo-master
  mkdir build && cd build
  cmake ..
  make
  sudo make install
  cd ../..
  rm libnabo-master -rf

  echo_message info 'Downloading and installing libpointmatcher ...'
  wget -c https://codeload.github.com/ethz-asl/libpointmatcher/zip/master
  unzip master
  rm master
  cd libpointmatcher-master
  mkdir build && cd build
  cmake ..
  make
  sudo make install
  cd ../..
  rm libpointmatcher-master -rf

  # Cleanup and finish
  echo_message success "Installation of libpointmatcher complete."
}

install_libpointmatcher
