#!/bin/bash

# Where are your dotfiles and where should they go
DOTFILES_HOME="$HOME/Documents/Code/projects/dotfiles"
DOTFILES_REPO="git://github.com/adrianrego/dotfiles.git"

# Remove vimfiles
echo " -- Deleting current files -- "

rm -f -R $HOME/.vim*
rm -f -R $HOME/.gvim*
rm -f -R $HOME/.bash_it
rm -f -R $DOTFILES_HOME

# Clone your dotfiles repo
echo " -- Cloning dotfiles -- "
echo
git clone -b experimental $DOTFILES_REPO $DOTFILES_HOME

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

BASH_PLUGINS="base.plugin.bash
extract.plugin.bash
git.plugins.bash
rvm.plugin.bash
vagrant.plugin.bash
virtualenv.plugin.bash"

BASH_ALIASES="general"

BASH_COMPLETION="git
git_flow"

mkdir $HOME/.bash_it/plugins/enabled
mkdir $HOME/.bash_it/aliases/enabled
mkdir $HOME/.bash_it/completion/enabled

for p in $BASH_PLUGINS
do
  ln -s $HOME/.bash_it/plugins/available/$p $HOME/.bash_it/plugins/enabled/$p
done

for a in $BASH_ALIASES
do
  ln -s $HOME/.bash_it/aliases/available/$a.aliases.bash $HOME/.bash_it/aliases/enabled/$a.aliases.bash
done

for c in $BASH_COMPLETION
do
  ln -s $HOME/.bash_it/completion/available/$c.completion.bash $HOME/.bash_it/completion/enabled/$c.completion.bash
done

echo
echo " -- Janus -- "
# Install Janus
git clone -b experimental git://github.com/adrianrego/janus.git ~/.vim
cd ~/.vim
rake

echo
echo " Restart your shell and enjoy! "
