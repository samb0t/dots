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
alias gdiff='git diff --ignore-space-at-eol -b -w --ignore-blank-lines'
alias chrome=google-chrome
alias xclip="xclip -selection c"
export GIT_EDITOR=vim

### keyboard
alias keyboard-virt-core='xinput | grep "Virtual core keyboard" | sed -n "s/.*id=\([0-9]\+\).*/\1/p"'
alias keyboard-builtin='xinput | grep Translated | sed -n "s/.*id=\([0-9]\+\).*/\1/p"'
alias keyboard-count='xinput | grep -c "slave  keyboard"'

# Make sure you have an alternate keyboard attached!
function togglek() {
    if [ $(loginctl show-session 2 -p Type) == *"wayland"*]; then
        swaymsg 'input 1:1:AT_Translated_Set_2_keyboard events toggle'
    else
        if  xinput | grep -q "Translated.*floating slave"; then
            xinput reattach $(keyboard-builtin) $(keyboard-virt-core)
        else
            if [ $(keyboard-count) -gt 8 ]; then
                xinput float $(keyboard-builtin)
            else
                echo "Why would you float the only available keyboard?"
            fi
        fi
    fi
}

alias dock='~/.screenlayout/ft.sh && togglek'
alias undock='~/.screenlayout/mono.sh && togglek'
### /keyboard

### Spawn in thread
function task() {
    eval "$*" > /dev/null 2>&1 & disown
}
### /Spawn in thread

### Files
function find-file() {
    find ./ -name "$1" -type f
}
function find-dir() {
    find ./ -name "$1" -type d
}
alias unzip-recursive='find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;'
### /Files

### sql
export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_6:$LD_LIBR
PATH=/opt/oracle/instantclient_19_6:$PATH
PATH=$HOME/bin:$PATH
export PATH
export ORACLE_HOME=$HOME/.oracle/network/admin
TNS_ADMIN=~
export TNS_ADMIN
# This fixes Intellij in Sway
export _JAVA_AWT_WM_NONREPARENTING=1
### /sql

BROWSER=google-chrome

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vup='pactl -- set-sink-volume 0 +5%'
alias vdn='pactl -- set-sink-volume 0 -5%'

# Avoid Software Flow Control - accidental XOFF when <C-s>
stty -ixon

alias taskman='ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head'

#Monitors
# xrandr --output eDP-1 --brightness 0.8 # This won't work in wayland
brightness () {
    xrandr --output eDP-1 --brightness $1
}
#/Monitors

#Wayland
alias screenshot='grim -g "$(slurp)" ~/Pictures/$(date +"%m-%d-%y-%H-%M-%S.png")'
#/Wayland

