#!/bin/bash

DOTFILES=($(dirname $0)/files/*)

SOURCE_DIR=~/git/dotfiles/files

pushd ~ > /dev/null 2>&1
for filename in ${DOTFILES[@]}; do
  f=$(basename $filename)
  if [ ! -e .${f} ]; then
    ln -s ${SOURCE_DIR}/${f} .${f}
  else
    if [ ! -L .${f} ]; then
      echo "~/.${f} is not a symlink; skipping"
    fi
  fi
done
popd > /dev/null 2>&1
