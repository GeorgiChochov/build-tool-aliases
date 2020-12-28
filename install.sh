BUILD_ALIAS_DIR="$HOME/.build-alias"
rm -rf "$BUILD_ALIAS_DIR"
cp -r "./src" "$BUILD_ALIAS_DIR"

if [[ -z "$BUILD_ALIAS_DIR" ]]; then
  echo "\n# build-aliases resolves build tools in the order in which they are listed in the TOOLS array." >> "$HOME/.zshrc"
  echo "# Add, remove or reorder build tools as needed." >> "$HOME/.zshrc"
  echo "# If you want to add your own build tool aliases you may do that based on the template provided in \"\$BUILD_ALIAS_DIR/build-tool-aliases/template-aliases.sh\"" >> "$HOME/.zshrc"
  echo "# You can also add a .aliases file to your project which will override all of the common build tool aliases" >> "$HOME/.zshrc"
  echo "TOOLS=(mvn gradle sbt mill)" >> "$HOME/.zshrc"
  echo "BUILD_ALIAS_DIR=\"\$HOME/.build-alias\"" >> "$HOME/.zshrc"
  echo "[[ -s \"\$BUILD_ALIAS_DIR/build-tool-aliases.sh\" ]] && source \"\$BUILD_ALIAS_DIR/build-tool-aliases.sh\"" >> "$HOME/.zshrc"
fi
