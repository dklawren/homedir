#!/bin/bash
############################
# makedotfiles.sh
# This script creates symlinks from the home
# directory to any desired dotfiles in ~/homedir/dotfiles
############################

########## Variables

REPO_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # dotfiles directory
REPO_OLD_DIR="$REPO_DIR/old"  # old dotfiles backup directory
FILE_LIST="$REPO_DIR/file_list" # list of files to symlink

# create dotfiles_old in homedir
if [ ! -d "$REPO_OLD_DIR" ]; then
    echo -n "Creating $REPO_OLD_DIR for backup of any existing files"
    mkdir -p $REPO_OLD_DIR
fi

# move any existing dotfiles in homedir to old directory,
# then create symlinks from the homedir to any files in this repo
for file in `cat $FILE_LIST`; do
    DIR_NAME="$( dirname ~/$file )"
    echo "dir_name: $DIR_NAME"
    if [ ! -d "$DIR_NAME" ]; then
        echo "Creating home path for $DIR_NAME"
        mkdir -p $DIR_NAME
    fi
    OLD_DIR_NAME="$( dirname $REPO_OLD_DIR/$file )"
    if [ ! -d "$OLD_DIR_NAME" ]; then
        echo "Creating backup path for $OLD_DIR_NAME"
        mkdir -p $OLD_DIR_NAME
    fi
    echo "Moving existing file from ~/$file to $REPO_OLD_DIR/$file"
    cp ~/$file $REPO_OLD_DIR/$file
    echo "Creating symlink for $file in home directory."
    ln -sf $REPO_DIR/$file ~/$file
done
