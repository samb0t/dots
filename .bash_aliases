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
# get a recent log for the current branch
alias hglg='hg glog -l 10 -b $(hg branch)'
alias hglog=hglg
# update to the tip of the current branch
alias hgup='hg up -r $(hglg | head -n 1 | sed "s#^.*\([0-9]*\):#\1#")'
alias chrome=google-chrome
alias xclip="xclip -selection c"

### keyboard
alias keyboard-virt-core='xinput | grep "Virtual core keyboard" | sed -n "s/.*id=\([0-9]\+\).*/\1/p"'
alias keyboard-builtin='xinput | grep Translated | sed -n "s/.*id=\([0-9]\+\).*/\1/p"'

# Make sure you have an alternate keyboard attached!
function togglek() {
    if  xinput | grep -q "Translated.*floating slave"; then
        xinput reattach $(keyboard-builtin) $(keyboard-virt-core)
    else
        xinput float $(keyboard-builtin)
    fi
}
### /keyboard


### sql
export LD_LIBRARY_PATH=/opt/oracle/instantclient_12_2:$LD_LIBR
PATH=/opt/oracle/instantclient_12_2:$PATH
PATH=$HOME/bin:$PATH
export PATH
export ORACLE_HOME=$HOME/.oracle/network/admin
TNS_ADMIN=~
export TNS_ADMIN
### /sql

BROWSER=google-chrome

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
