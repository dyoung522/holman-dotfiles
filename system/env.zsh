export PGDATA="/usr/local/var/postgres"

export EDITOR="vim"
#[[ -x /usr/local/bin/mvim ]] && EDITOR="mvim --nofork"
#[[ -x /usr/local/bin/subl ]] && EDITOR="subl -w"

# Increate the OPEN FILES limit
ulimit -S -n 2048
