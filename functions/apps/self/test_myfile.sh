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

function install_myfile {
  echo_message info 'Downloading '$NAME'...'
  mkdir -p $HOME/bxgithub
  cd $HOME/bxgithub
  git clone https://github.com/baoxianzhang/myfile.git

  # softlink zsh
  rm -f $HOME/.zshrc
  ln -s $HOME/bxgithub/myfile/zshrc $HOME/.zshrc

  # spacemacs.d
  rm -rf $HOME/.spacemacs.d
  ln -s $HOME/bxgithub/myfile/spacemacs.d $HOME/.spacemacs.d

  # tmux
  rm -rf $HOME/.tmux.conf
  ln -s $HOME/bxgithub/myfile/tmux.conf $HOME/.tmux.conf

  # spf13 vim
  rm -rf $HOME/.vimrc.before.local
  ln -s $HOME/bxgithub/myfile/vimrc.before.local $HOME/.vimrc.before.local
  rm -rf $HOME/.vimrc.bundles.local
  ln -s $HOME/bxgithub/myfile/vimrc.bundles.local $HOME/.vimrc.bundles.local

  # Install package(s)
  echo_message info 'Installing '$NAME'...'
  echo_message success "Installation of myfile complete."
}

install_myfile
