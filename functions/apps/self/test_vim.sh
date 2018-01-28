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
function install_vim {
  echo_message info 'Installing '$NAME'...'
  wget -nc -O vim.zip https://github.com/vim/vim/archive/master.zip
  unzip -o vim.zip
  mv vim-master vim

  sudo "apt-get remove -y --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common"
  sudo "apt-get build-dep vim-gnome"
  sudo "apt-get install -y liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev"
  sudo "rm -rf /usr/local/share/vim"
  sudo "rm -rf /usr/bin/vim"
  sudo "mkdir /usr/include/lua5.1/include/"
  sudo "mv /usr/include/lua5.1/*.h /usr/include/lua5.1/include/"
  sudo "ln -s /usr/bin/luajit-2.0.0-beta9 /usr/bin/luajit"
  cd vim/src
  make distclean
  ./configure --with-features=huge \
              --enable-rubyinterp \
              --enable-largefile \
              --disable-netbeans \
              --enable-pythoninterp \
              --with-python-config-dir=/usr/lib/python2.7/config \
              --enable-perlinterp \
              --enable-luainterp \
              --with-luajit \
              --enable-gui=auto \
              --enable-fail-if-missing \
              --with-lua-prefix=/usr/include/lua5.1 \
              --enable-cscope
  make
  sudo "make install"

  wget https://raw.githubusercontent.com/spf13/spf13-vim/3.0/bootstrap.sh
  chmod +x bootstrap.sh
  ./bootstrap.sh
  rm bootstrap.sh

  # clean
  cd ../..
  rm vim.zip -rf
  rm vim -rf

  echo_message success "Installation of vim complete."
}


install_vim
