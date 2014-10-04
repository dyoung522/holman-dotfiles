alias sshgo="ssh -YAt"
alias sshrun="ssh -At"
alias pgrep="pgrep -fil"
alias pkill="pkill -f"
alias flushdns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias stopdns="sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"
alias startdns="sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"
alias restartdns="stopdns && sleep 1 && startdns"

# ASDM
alias asdm="screen /dev/tty.usbserial-A501JX6Z"

# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null) ; then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias fixperms="find ~/Dropbox -type d -exec chmod 0755 {} \; ; find ~/Dropbox -type f -exec chmod g-wx,o-wx {} \;"
alias stoptftp="sudo launchctl stop com.apple.tftpd; sudo launchctl unload /System/Library/LaunchDaemons/tftp.plist"
alias starttftp="sudo launchctl load -F /System/Library/LaunchDaemons/tftp.plist && sudo launchctl start com.apple.tftpd"
alias restarttftp="stoptftp && sleep 1 && starttftp"
