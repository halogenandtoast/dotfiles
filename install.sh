#!/usr/bin/env zsh
setopt extended_glob
mkdir ~/test
for i in (*~install.sh)
do
  cp -R ./$i ~/.$i
done
