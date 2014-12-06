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

# Modify the path
pathmunge /usr/local/bin        force
pathmunge /usr/local/sbin       force

pathmunge /usr/local/heroku/bin
pathmunge /usr/local/lib/node_modules after

pathmunge $HOME/.rbenv/bin
pathmunge $HOME/.bin            after
pathmunge $HOME/bin             after

# Cleanup
unset pathmunge

# Make PATH unique
typeset -U PATH
