export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

[[ -f ~/.nvmrc ]] && export NODE_VERSION=$(cat ~/.nvmrc)

function switch_node_version() {
  if (( $+functions[nvm] )); then
    if [[ -f '.nvmrc' ]]; then
      nvm use $(cat .nvmrc) > /dev/null
    else
      nvm use $(cat ~/.nvmrc) > /dev/null
    fi
  fi
}

chpwd_functions=(${chpwd_functions[@]} "switch_node_version")

switch_node_version
