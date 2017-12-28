# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# If possible, add tab completion for many more commands
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Docker environment config for windows
if [ "$(hostname)" == "Windows" ] || [ "$(hostname)" == "DKL-LAPTOP"  ]; then
    #export DOCKER_HOST=tcp://192.168.2.2:2375
    export DOCKER_HOST=tcp://localhost:2375
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,aliases,functions,helpers,path,exports}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Python3 virtualenvwrapper
#if [ "$(uname)" == "Linux" ]; then
#    source $(which virtualenvwrapper.sh)
#fi

# https://github.com/github/hub
eval "$(hub alias -s)"

cd $HOME
