#!/bin/bash
############################
# makedotfiles.sh
# This script creates symlinks from the home
# directory to any desired dotfiles in ~/homedir/dotfiles
############################

########## Variables

dir=~/homedir/dotfiles         # dotfiles directory
olddir=~/homedir/dotfiles_old  # old dotfiles backup directory

# list of files/folders to symlink in homedir
dotfiles="aliases bashrc bash_profile bash_prompt bazaar exports functions gitconfig gitignore helpers osx path"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the dotfiles
# directory specified in $files
for file in $dotfiles; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
