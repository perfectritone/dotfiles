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
export JRUBY_OPTS="--1.9 -J-XX:MaxPermSize=256m -Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF --headless -J-XX:+CMSClassUnloadingEnabled -J-XX:+UseConcMarkSweepGC --debug"
export EDITOR="vim"

unamestr=`uname`

# My Mac
if [[ $unamestr == 'Darwin' ]]; then
  export CODE_DIR=$HOME/code
  export DYLD_LIBRARY_PATH=~/scripts/instantclient_11_2
# My CentOS vm
elif [[ $unamestr == 'Linux' ]]; then
  export CODE_DIR=/git
# Arch Linux
else
  export CODE_DIR=$HOME/projects/zipcar
fi

alias c="cd $CODE_DIR"

alias fbn='find . -name'

alias editgit='vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

alias a="sudo loadkeys us"
alias z="setxkbmap us"
alias x="setxkbmap us -variant colemak"

# For arch
alias ok="$(ssh-agent) ssh-add ~/.ssh/nopass_id_rsa"

if [ -f ~/.zshrc-local ]; then
  source ~/.zshrc-local
fi

if [ -n "$ZIPCAR" ]; then
  alias rc="cd $CODE_DIR/zipcar-rails-core"
  alias zm="cd $CODE_DIR/zipcar-main"
  alias zipsite="cd $CODE_DIR/zipcar-main/zipcar-acs/packages/zipsite/sql"
  alias ctu="cd $CODE_DIR/carsharing-transition-ui"
  alias ba="cd $CODE_DIR/billing-api"
  alias zk="cd $CODE_DIR/zipkernel"
  alias pg="cd $CODE_DIR/payment-gateway-api"
  alias ff="cd $CODE_DIR/franchise-feeds-api"
  alias fa="cd $CODE_DIR/franchise-api"
  alias ck="cd $CODE_DIR/checkpoint"
  alias ca="cd $CODE_DIR/core-api"
  alias vin="cd $CODE_DIR/vindicia-integration"
  alias bs="cd $CODE_DIR/billing-service"

  alias truncate="ca;RAILS_ENV=test bundle exec rake db:truncate"
  alias monday="sudo echo;zm;bundle;bundle exec rake monday;truncate"

  export PREFERRED_SNAP=83
  snap () {
    if (( $# == 0 ))
    then num=$PREFERRED_SNAP
    else num=$1
    fi
    ssh uscamwebd${num}.boston.zipcar.com
  }

  upgrade() { perl $CODE_DIR/zipcar-main/zipcar-acs/upgrade/$*.pl -s zipcar -w /web -c $ORACLE_CONNECT }
  downgrade() { perl $CODE_DIR/zipcar-main/zipcar-acs/downgrade/$*.pl -s zipcar -w /web -c $ORACLE_CONNECT }
  upgrade-test() { perl $CODE_DIR/zipcar-main/zipcar-acs/upgrade/$*.pl -s zipcar -w /web -c $ORACLE_TEST }
  downgrade-test() { perl $CODE_DIR/zipcar-main/zipcar-acs/downgrade/$*.pl -s zipcar -w /web -c $ORACLE_TEST }
  alias sqlplus-me="sqlplus $ORACLE_CONNECT"

  alias remote="java -jar ~/Downloads/tightvnc-1.3.10_javabin/classes/VncViewer.jar HOST 10.144.33.90"
fi
