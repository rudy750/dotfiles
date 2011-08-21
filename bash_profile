#!/bin/bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=/usr/local/bin:/usr/local/python:$PATH

case $( uname -s ) in
    Linux )
        export PATH=/usr/local/bin:$PATH
        export WORKON_HOME=/opt/envs
        ;;
    Darwin )
        export PATH=/usr/local/bin:/usr/local/share/python:$PATH
        export HOMEBREW_TEMP=/usr/local/tmp
        export WORKON_HOME=$HOME/.virtualenvs
        export NODE_PATH=/usr/local/lib/node
        ;;
esac

# pip and virtualenv
export VIRTUALENV_USE_DISTRIBUTE=1
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

# Don't litter pip_log.txt files in cwd!
export PIP_LOG_FILE='/tmp/pip-log.txt'

# Path to the bash it configuration
export BASH=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_THEME='tylenol'

# Set my editor and git editor
export EDITOR='vim'
export GIT_EDITOR='vim'

# Don't check mail when opening terminal.
unset MAILCHECK

# Load Bash It
source $BASH/bash_it.sh
