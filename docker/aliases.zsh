# Core
alias dm=docker-machine
alias dcomp=docker-compose

# Helpers

# Delete all containers
alias drmca='docker rm $(docker ps -a -q)'

# Delete all images
alias drmia='docker rmi $(docker images -q)'

# Delete all containers and images
alias drma='drmca && drmia'

# Legacy
alias fig=docker-compose
alias boot2docker=docker-machine

# Functions
function dme() {
  VM=${1:=dev}
  echo "Docker now using ${VM}"
  eval $(docker-machine env ${VM})
}

