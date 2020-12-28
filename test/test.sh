CURRENT_DIR=$(dirname $(realpath $0))

TOOLS=(
  mvn
  gradle
  sbt
)

BUILD_ALIAS_DIR="$CURRENT_DIR/../src"
source "$BUILD_ALIAS_DIR/build-tool-aliases.sh"

exitOnError() {
  exitCode=$?
  if [[ $exitCode != 0 ]]; then
    exit "$exitCode"
  fi
}

for dir in $CURRENT_DIR/*/ ; do
  echo "$dir"
  cd $dir || continue
  loadBuildAliases
  echo "build"
  b
  exitOnError
  echo "test"
  t
  exitOnError
  echo "clean build"
  cb
  exitOnError
  echo "clean full build"
  cfb
  exitOnError
  echo "full build"
  fb
  exitOnError
  echo "clean"
  c
  exitOnError
done
