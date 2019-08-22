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

function install_ceres_solver {
  sudo apt-get install cmake
  sudo apt-get install libgoogle-glog-dev
  sudo apt-get install libatlas-base-dev
  sudo apt-get install libeigen3-dev
  sudo apt-get install libsuitesparse-dev

  echo_message info 'Downloading ceres_solver ...'
  wget -c https://codeload.github.com/ceres-solver/ceres-solver/zip/master
  unzip master
  rm master
  cd ceres-solver-master
  mkdir build && cd build
  cmake ..
  make
  sudo make install
  cd ../..
  rm ceres-solver-master -rf
  # Cleanup and finish
  echo_message success "Installation of ceres_solver complete."
}

install_ceres_solver
