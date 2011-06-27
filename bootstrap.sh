#!/bin/bash

# Where are your dotfiles and where should they go
DOTFILES_HOME="$HOME/Documents/Code/projects/dotfiles"
DOTFILES_REPO="git://github.com/adrianrego/dotfiles.git"

# Remove vimfiles
echo " -- Deleting current files -- "

rm -f -R $HOME/.vim*
rm -f -R $HOME/.gvim*
rm -f -R $HOME/.bash_it

# Clone your dotfiles repo
echo " -- Cloning dotfiles -- "
echo
git clone $DOTFILES_REPO $DOTFILES_HOME

echo " -- Linking files -- "
for f in $(ls $DOTFILES_HOME)
do
  if [ $f != 'bootstrap.sh' ]
    then
      source="$DOTFILES_HOME/$f"
      dest="$HOME/.$f"
      $(ln -fs $source $dest)
    fi
done

echo " -- Bash IT -- "
# Install bash_it
git clone git://github.com/revans/bash-it.git ~/.bash_it

echo
echo " -- Janus -- "
# Install Janus
git clone git://github.com/carlhuda/janus.git ~/.vim
cd ~/.vim
rake

echo
echo " Restart your shell and enjoy! "
