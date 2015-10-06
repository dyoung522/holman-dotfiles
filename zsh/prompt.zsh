autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] )) ; then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]] ; then
    echo ""
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

node_version() {
  if (( $+commands[node] )) ; then
    echo "Node $(node --version)"
  fi
}

node_prompt() {
  if ! [[ -z "$(node_version)" ]] ; then
    echo -n "| %{$fg_bold[blue]%}$(node_version)%{$reset_color%} "
  else
    echo ''
  fi
}

ruby_version() {
  if (( $+commands[rbenv] )) ; then
    echo "Ruby $(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] )) ; then
    echo "Ruby $(rvm-prompt | awk '{print $1}')"
  fi
}

rails_version() {
  if [[ -f "Gemfile.lock" ]] ; then
    if grep -q rails Gemfile.lock ; then
      echo "Rails $(egrep '\srails\s\(\d.*\)' Gemfile.lock | sed -e 's/^ *rails (//' -e 's/) *$//')"
    fi
  fi
}

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]] ; then
    echo -n "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
    if ! [[ -z "$(rails_version)" ]] ; then
      echo "/ %{$fg_bold[yellow]%}$(rails_version)%{$reset_color%} "
    fi
  else
    echo ""
  fi
}

host_name() {
  echo "%{$fg_bold[green]%}$(hostname -s)%{$reset_color%} "
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

export PROMPT=$'\n$(rb_prompt)$(node_prompt)$(git_dirty)$(need_push)\n$(host_name)$(directory_name) › '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
