is_gradle() {
  ifVerboseEcho "Looking for gradle build files..."
  if [[ -f "build.gradle" || -f "build.gradle.kts" ]]; then
    ifVerboseEcho "Found $(ls build.gradle*)"
    return 0
  else
    ifVerboseEcho "Did not find any gradle build files."
    return 1
  fi
}

alias build='gradle build -x test'
alias clean='gradle clean'
alias cleanBuild='gradle clean build -x test'
alias fullBuild='gradle build'
alias cleanFullBuild='gradle clean build'
alias tests='gradle test'
alias localPublish='gradle publishToLocalMaven'
alias remotePublish='gradle publish'
alias dependencies='gradle dependencies'
