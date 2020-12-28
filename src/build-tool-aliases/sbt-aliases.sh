is_sbt() {
  ifVerboseEcho "Looking for sbt build files..."
  if [[ -f "build.sbt" ]]; then
    ifVerboseEcho "Found $(ls ./*.sbt)"
    return 0
  else
    ifVerboseEcho "Did not find sbt build files."
    return 1
  fi
}

export SBT_NATIVE_CLIENT=true

alias build='sbt compile'
alias clean='sbt clean'
alias cleanBuild='sbt "clean;compile"'
alias fullBuild='sbt package'
alias cleanFullBuild='sbt "clean;package"'
alias tests='sbt test'
alias localPublish='sbt publishLocal'
alias remotePublish='sbt publish'
alias dependencies='sbt dependencyTree'
