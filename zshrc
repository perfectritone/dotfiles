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

# export PATH="/Users/dfrey/.rvm/gems/jruby-1.7.6/bin:/Users/dfrey/.rvm/gems/jruby-1.7.6@global/bin:/Users/dfrey/.rvm/rubies/jruby-1.7.6/bin:/Users/dfrey/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
export TNS_ADMIN="/etc"
export JRUBY_OPTS="--1.9 -J-XX:MaxPermSize=256m -Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF --headless -J-XX:+CMSClassUnloadingEnabled -J-XX:+UseConcMarkSweepGC"
export EDITOR="vim"

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  export CODE_DIR=$HOME/code
else
  export CODE_DIR=$HOME/projects/zipcar
fi

alias rc="cd $CODE_DIR/zipcar-rails-core"
alias zm="cd $CODE_DIR/zipcar-main"
alias ctu="cd $CODE_DIR/carsharing-transition-ui"
alias authserv="ctu;bundle exec rails s -p 3100 -P tmp/pids/server3100.pid"
alias pk="pkill -9 java"

export PREFERRED_SNAP=83
snap () {
  if (( $# == 0 ))
  then num=$PREFERRED_SNAP
  else num=$1
  fi
  ssh uscamwebd${num}.boston.zipcar.com
}

alias testfleet="ctu;RAILS_ENV=test bundle exec rake test_fleets:create"

alias vi="vim"

alias fbn='find . -name'

alias editgit='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi
