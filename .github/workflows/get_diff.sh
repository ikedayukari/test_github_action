#!/usr/bin/env bash

upload_files=($(sed -nr 's|^abcde: (.+) to aa://.+$|\1|p' ./.github/workflows/log.txt))
echo "upload_files : " "${upload_files[@]}"
combine=("${upload_files[@]}" "${1}")
echo "combine : " "${combine[@]}"

IFS=$'\n'
diff=($( (echo "${combine[*]}" | sort -u; echo "${upload_files[*]}") | sort | uniq -u))
echo "diff : " "${diff[@]}"

for file in "${diff[@]}"; do
    echo "${file}"
done
