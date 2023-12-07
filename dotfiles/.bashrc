# ----------------------------------------------------------------------------
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ----------------------------------------------------------------------------
# Shell options
shopt -s checkwinsize
shopt -s globstar
shopt -s histappend

# ----------------------------------------------------------------------------
# History control
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# ----------------------------------------------------------------------------
# Aliases and color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ----------------------------------------------------------------------------
# Color prompt
export TERM=xterm-256color

ORANGE="\[$(tput setaf 208)\]"
YELLOW="\[$(tput setaf 214)\]"
GREEN="\[$(tput setaf 142)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

PS1="${BOLD}${ORANGE}\u ${RESET}"
PS1+="${BOLD}at ${RESET}"
PS1+="${BOLD}${YELLOW}\h ${RESET}"
PS1+="${BOLD}in ${RESET}"
PS1+="${BOLD}${GREEN}\W ${RESET}"
PS1+="${BOLD}> ${RESET}"

# ----------------------------------------------------------------------------
# Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# ----------------------------------------------------------------------------
# Cuda
export PATH=/usr/local/cuda-12.1/bin${PATH:+:${PATH}}

# ----------------------------------------------------------------------------
# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ----------------------------------------------------------------------------
# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ----------------------------------------------------------------------------
# More aliases
alias google-chrome='/usr/bin/google-chrome-stable --no-sandbox --disable-gpu'
alias nvvp='/usr/local/cuda-12.1/bin/nvvp -vm /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java'
alias code='/usr/share/code/code --no-sandbox --user-data-dir $HOME/vscode'
alias drawio='/opt/drawio/drawio --no-sandbox'
alias greed='/usr/games/greed'
