is_mill() {
  ifVerboseEcho "Looking for mill build files..."
  if [[ -f "build.sc" ]]; then
    ifVerboseEcho "Found build.sc"
    return 0
  else
    ifVerboseEcho "Did not find mill build files."
    return 1
  fi
}

alias build='./mill __.compile'
alias clean='./mill clean'
alias cleanBuild='./mill all __.{clean,compile}'
alias fullBuild='./mill all __.{test,jar}'
alias cleanFullBuild='./mill all __.{clean,test,jar}'
alias tests='./mill __.test'
alias localPublish='./mill __.publishLocal'
alias remotePublish='./mill __.publish'
alias dependencies='./mill __.ivyDepsTree'
