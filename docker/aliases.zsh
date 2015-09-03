# Core
alias dm=docker-machine
alias dcomp=docker-compose
alias dc-='docker-compose'
alias dc-build='docker-compose build'
alias dc-up='docker-compose up'
alias dc-down='docker-compose stop'
alias dc-run='docker-compose run'
alias dc-ps='docker-compose ps'
alias dc-logs='docker-compose logs'

# Helpers
alias dm=docker-machine
alias dc-b=dc-build

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
  echo "Switching to ${VM}, please wait..."
  eval $(docker-machine env ${VM})
  echo "Docker now using ${VM}"
}

