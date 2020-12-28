is_mvn() {
  ifVerboseEcho "Looking for maven build files"
  if [[ -f "pom.xml" || -d ".mvn" ]]; then
    ifVerboseEcho "Found $(ls pom.*)"
    return 0
  else
    ifVerboseEcho "Did not find any maven build files."
    return 1
  fi
}

alias build='mvn compile'
alias clean='mvn clean'
alias cleanBuild='mvn clean compile'
alias fullBuild='mvn package'
alias cleanFullBuild='mvn clean package'
alias tests='mvn test'
alias localPublish='mvn install'
alias remotePublish='mvn deploy'
alias dependencies='mvn dependency:tree'
