#!/bin/bash

# Global Perl dependencies
if [ ! -e "/usr/bin/cpanm" ]; then
    if [ "$(uname)" == "Darwin" ]; then
        brew install wget
    else
        sudo yum install wget 'perl(ExtUtils::Manifest)' 'perl(ExtUtils::MakeMaker)'
    fi
    sudo wget https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm -O /usr/bin/cpanm
    sudo chmod 755 /usr/bin/cpanm
fi

if [ "$BUGZILLA_LIB" != "" ]; then
    export PERL5LIB=$BUGZILLA_LIB
fi

export CPANM="sudo cpanm --quiet --notest --skip-satisfied"

$CPANM --uninstall JSON::RPC
$CPANM JSON::RPC@1.01
$CPANM App::SimpleHTTPServer
$CPANM Devel::NYTProf
$CPANM Email::Sender;
$CPANM File::Slurp
$CPANM HTML::FormatText::WithLinks
$CPANM IPC::System::Simple
$CPANM Net::RabbitMQ
$CPANM Net::SMTP::SSL
$CPANM REST::Client
$CPANM Term::ReadKey
$CPANM Text::MultiMarkdown

# Bugzilla dev manager configuration
if [ ! -e "$HOME/bugzilla-dev-manager" ]; then
    git clone https://github.com/dklawren/bugzilla-dev-manager.git \
        -b app $HOME/bugzilla-dev-manager
    cd $HOME/bugzilla-dev-manager && $CPANM --installdeps .
    mkdir $HOME/bin
    ln -sf $HOME/bugzilla-dev-manager/bz-command $HOME/bin/bz
    sudo cp $HOME/bugzilla-dev-manager/bz-dev.conf-sample /etc/bz-dev.conf
fi

sudo pip install jedi

# Vim configuration
if [ ! -e "$HOME/.vim" ]; then
    sudo yum -q -y install vim-enhanced
    git clone https://github.com/dklawren/dotvim $HOME/.vim
    cd $HOME/.vim
    git submodule update --init
    vim +PluginInstall +qall
    ln -sf $HOME/.vim/rc/vimrc $HOME/.vimrc
    git clone https://github.com/powerline/fonts.git $HOME/powerline-fonts
    cd $HOME/powerline-fonts && ./install.sh
fi

if [ "$(uname)" == "linux" ]; then
    sudo localedef -i en_US -f UTF-8 en_US.UTF-8
fi

# Remove CPAN build files to minimize disk usage
sudo rm -rf ~/.cpan*

# Create symlinks from the home directory to any
# desired dotfiles in ~/homedir/dotfiles

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
