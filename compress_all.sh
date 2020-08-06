#!/bin/bash

NORM=`tput sgr0`
CYAN=`tput setaf 6`

echo
echo "----------------------------------------"
echo "Compressing all folders..."
echo "----------------------------------------"
echo
for file in *; do
  if [[ -d "$file" && ! -L "$file" ]]; then
    echo "Compressing: ${CYAN}$file${NORM}"
    tar -I pxz -cf "$file".tar.xz "$file";
  fi;
done
echo
echo "All done, folders are compressed..."
echo

exit 0

