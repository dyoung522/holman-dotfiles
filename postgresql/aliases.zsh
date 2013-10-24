alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias pgrestart='pgstop && sleep 1 && pgstart'

alias pglstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pglstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pglrestart='pglstop && sleep 1 && pglstart'
