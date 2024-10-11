# If not running interactively, exit
case $- in *i*) ;; *) return ;; esac

# History settings
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%m/%d/%y %T "
HISTCONTROL=ignoredups:erasedups

# Adjust window size after each command
shopt -s checkwinsize

# Enable less for non-text files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Aliases
alias h=’history’
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias k='kubectl'
alias o=xdg-open
alias home='cd ~'
alias root='cd /'
alias ghidra='~/ghidra/ghidraRun'

export GREP_OPTIONS=' — color=auto'
export EDITOR=vim

# Enable programmable completion
if ! shopt -oq posix; then
	[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
	[ -f /etc/bash_completion ] && . /etc/bash_completion
fi

# Kubebuilder autocompletion
[ -f /usr/local/share/bash-completion/bash_completion ] && . /usr/local/share/bash-completion/bash_completion
. <(kubebuilder completion bash)

# NVM (Node Version Manager) setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pyenv setup
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Load blesh (Bash Line Editor)
source ~/.local/share/blesh/ble.sh

# Load Cargo
. "$HOME/.cargo/env"

# Starship
eval "$(starship init bash)"
