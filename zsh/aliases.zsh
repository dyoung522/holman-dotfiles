function pathmunge() {
    if [ "$2" = "force" ] || ! echo $PATH | $(which egrep) -q "(^|:)$1($|:)" ; then
        if [ "$2" = "after" ] ; then
            PATH=$PATH:$1
        else
            PATH=$1:$PATH
        fi
        export PATH
    fi
}

function ntab() {
    if [[ $# == 0 ]]; then
        ThisDirectory=$PWD
    elif [[ $# == 1 && -d "$1" ]]; then
        ThisDirectory="$@"
    else
        print "usage: ntab [directory]"
        return 1
    fi

    osascript <<-eof
    tell application "Terminal"
        tell the front terminal 
            launch session "Default Session"
            tell the last session
                write text "cd \"$ThisDirectory\""
            end tell
        end tell
    end tell
eof
}

function gotab() {
    local CMD
    [[ $# -ne 0 ]] && local CMD="write text \"bin/ssh_connect $@ && exit\""
    osascript <<-eof
    tell application "Terminal"
        tell the front terminal 
            launch session "Default Session"
            tell the last session
                $CMD
            end tell
        end tell
    end tell
eof
}

function git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

alias go="ssh -YAt"

alias ls="ls -@GO"
alias run="ssh -At"
alias pgrep="pgrep -fil"
alias pkill="pkill -f"
alias flushdns="sudo dscacheutil -flushcache"

# ASDM
alias asdm="screen /dev/tty.usbserial-A501JX6Z"

# Vim aliases
alias mvi="mvim"
which mvim &>/dev/null && alias vi="mvi"
#which subl &>/dev/null && alias vi="subl"

# Rails shortcuts
alias railsnew="rails new . -m https://raw.github.com/RailsApps/rails-composer/master/composer.rb -T"

# PostgreSQL
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pgstop && sleep 1 && pgstart'

# Git
alias gci="git add . && git commit -a"
which hub >/dev/null && eval "$(hub alias -s)"

alias reload!='. ~/.zshrc'
