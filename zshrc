# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=robbyrussell

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR="vim"

unamestr=`uname`

# My Mac
if [[ $unamestr == 'Darwin' ]]; then
  export CODE_DIR=$HOME/code
elif [[ $unamestr == 'Linux' ]]; then
  export CODE_DIR=$HOME/code
fi

alias n="cd $HOME/notes"

fbn() { find . -name \*$*\* }
tn() { tmux new-session -s $* }
ta() { tmux attach-session -t $* }

alias editgit='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh;source ~/.zshrc'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias zxcvb="sudo loadkeys us"
alias z="setxkbmap us"
alias x="setxkbmap us -variant colemak;xmodmap ~/.xmodmaprc"

alias rinse="mplayer -playlist http://r3.dgen.net:8000/rinseradio.m3u -cache 100"

eval `dircolors ~/.dir_colors`
bindkey -v

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
