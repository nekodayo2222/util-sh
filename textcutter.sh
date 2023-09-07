#!/bin/bash

read -p 'ファイル名 > '
file="$REPLY"
read -p '区切り文字 > '
if [ -e "$file" ]; then
  while IFS= read -r line; do
    first_part="${line%%$REPLY*}"
    echo "$first_part"
  done < "$file" > "new_$file"

  mv "new_$file" "$file"
else
  echo "指定されたファイルが見つかりません。"
fi
