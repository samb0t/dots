# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

### alias for dotfile config tracking
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
### /alias for dotfile config tracking

alias pbcopy='xclip -sel clip'
# get the count of incoming changes on the current branch
alias hgin='hg in | grep "branch:\s\+$(hg branch)" | wc -l'

### sql
export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBR
export PATH=/opt/oracle/instantclient_12_2:$PATH
export ORACLE_HOME=$HOME/.oracle/network/admin
TNS_ADMIN=~
export TNS_ADMIN
### /sql

BROWSER=google-chrome
