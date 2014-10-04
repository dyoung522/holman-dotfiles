export PGDATA="/usr/local/var/postgres"

EDITOR="vim"
[[ -x /usr/local/bin/mvim ]] && EDITOR="mvim --nofork"
[[ -x /usr/local/bin/subl ]] && EDITOR="subl -w"
export EDITOR
