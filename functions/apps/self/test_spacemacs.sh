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
function install_spacemacs {
  echo_message info 'Downloading '$NAME'...'
  wget -nc http://mirrors.ustc.edu.cn/gnu/emacs/emacs-25.3.tar.gz
  tar -xf emacs-25.3.tar.gz
  cd emacs-25.3
  sudo apt-get install -y libgtk2.0-dev
  sudo apt-get install -y libxpm-dev
  sudo apt-get install -y libncurses5-dev
  sudo apt-get install -y libjpeg-dev
  sudo apt-get install -y libgif-dev
  sudo apt-get install -y libtiff5-dev
  ./configure
  make
  sudo make install

  # clean
  cd ..
  rm emacs-25.3 -rf
  rm emacs-25.3.tar.gz

  mkdir ~/bxgithub
  cd ~/bxgithub
  git clone https://github.com/syl20bnr/spacemacs.git
  cd spacemacs
  git checkout develop
  rm -rf ~/.emacs.d
  ln -s ~/bxgithub/spacemacs ~/.emacs.d

  # install tern
  sudo apt-get install -y npm
  sudo npm install -g tern

  # install source-code-pro
  wget -c https://www.fontsquirrel.com/fonts/download/source-code-pro
  FONT_PATH=/usr/share/fonts/opentype
  sudo mkdir $FONT_PATH
  sudo unzip source-code-pro -d $FONT_PATH
  cd $FONT_PATH
  sudo fc-cache -f -v

  # Install package(s)
  echo_message info 'Installing '$NAME'...'
  echo_message success "Installation of spacemacs complete."
}

install_spacemacs
