export NVM_DIR="$HOME/.nvm"

[[ -f "${NVM_DIR}/nvm.sh" ]] && source "${NVM_DIR}/nvm.sh"

function switch_node_version() {
  if (( $+functions[nvm] )); then
    NODE_VERSION=$(cat ~/.nvmrc)
    [[ -f ".nvmrc" ]] && NODE_VERSION=$(cat .nvmrc)

    nvm use --delete-prefix ${NODE_VERSION} > /dev/null
  fi
}

chpwd_functions=(${chpwd_functions[@]} "switch_node_version")

switch_node_version

