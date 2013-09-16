# Modify the path
pathmunge /usr/local/bin        force
pathmunge /usr/local/sbin       force
pathmunge $HOME/.rbenv/bin
pathmunge /usr/local/heroku/bin
pathmunge $HOME/bin             after

# Make PATH unique
typeset -U PATH
