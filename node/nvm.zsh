export NVM_DIR=~/.nvm

if [ -f "${NVM_DIR}/nvm.sh" ]; then
  source "${NVM_DIR}/nvm.sh"
elif which -s brew >/dev/null; then
  source $(brew --prefix nvm)/nvm.sh
else
  exit
fi

function switch_node_version() {
  if (( $+functions[nvm] )); then
    if [ -f '.nvmrc' ]; then
      nvm use $(cat .nvmrc) > /dev/null
    else
      nvm use $(cat ~/.nvmrc) > /dev/null
    fi
  fi
}

chpwd_functions=(${chpwd_functions[@]} "switch_node_version")

switch_node_version

