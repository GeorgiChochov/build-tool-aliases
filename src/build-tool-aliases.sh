alias b="build"
alias c="clean"
alias cbuild="cleanBuild"
alias cb="cbuild"
alias fbuild="fullBuild"
alias fb="fbuild"
alias cfbuild="cleanFullBuild"
alias cfb="cfbuild"
alias t="tests"
alias lpublish="localPublish"
alias lp="lpublish"
alias rpublish="remotePublish"
alias rp="rpublish"
alias deps="dependencies"

BUILD_TOOL_ALIASES_DIR="$BUILD_ALIAS_DIR/build-tool-aliases"
source $BUILD_TOOL_ALIASES_DIR/empty-aliases.sh

ifVerboseEcho() {
  if [[ $VERBOSE_GUESS ]]; then
    echo "$@"
  fi
}

loadProjectAliases() {
  ifVerboseEcho "Found .aliases file, will not look for other build tool aliases."
  echo "Loading project-specific .aliases!"
  source ".aliases"
}

determineAndLoadAliases() {
  for tool in "${TOOLS[@]}"; do
    source $BUILD_TOOL_ALIASES_DIR/$tool-aliases.sh
    if "is_$tool"; then
      echo "Loading $tool aliases!"
      unset VERBOSE_GUESS
      return 0
    fi
    source $BUILD_TOOL_ALIASES_DIR/empty-aliases.sh
  done

  echo "Did not find any build files in the current directory for your build tools: ${TOOLS[*]}"
  unset VERBOSE_GUESS
  return 1
}

loadBuildAliases() {
  if [[ $1 == "-v" ]]; then
    export VERBOSE_GUESS=true
  fi

  if [[ -f ".aliases" ]]; then
    loadProjectAliases
  else
    determineAndLoadAliases
  fi
}
