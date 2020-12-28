alias build='loadAndRun build'
alias clean='loadAndRun clean'
alias cleanBuild='loadAndRun cleanBuild'
alias fullBuild='loadAndRun fullBuild'
alias cleanFullBuild='loadAndRun cleanFullBuild'
alias tests='loadAndRun tests'
alias localPublish='loadAndRun localPublish'
alias remotePublish='loadAndRun remotePublish'
alias dependencies='loadAndRun dependencies'

function loadAndRun() {
  loadBuildAliases || return 1
  executeAlias "$1"
}

function executeAlias() {
  IFS=$'\n'
  if [[ -n "$ZSH_VERSION" ]]; then
    setopt BASH_REMATCH
    match_group=3
  elif [[ -n "$BASH_VERSION" ]]; then
    match_group=2
  fi

  for a in $(alias); do
    if [[ $a =~ ^(alias )?$1=\'(.+)\' ]]; then
      com="${BASH_REMATCH[$match_group]}"
      echo "$com"
      break
    fi
  done
  eval "$com"
  IFS=$' '
}
