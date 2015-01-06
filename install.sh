#!/bin/bash

install_marker=~/.kerrick_dotfiles_installed

for f in ~/.dotfiles/*.common; do
  local="${f%.common}.local"
  target=~/".$(basename -s .common "$f")"
  if [ \( ! -f "${install_marker}" \) -a -f "${target}" ]; then
    cp "$target" "$local"
  fi
  touch "$local"
  cat "$f" "$local" > "$target"
done

touch "$install_marker"
