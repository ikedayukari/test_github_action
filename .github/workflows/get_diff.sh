#!/usr/bin/env bash

upload_files=($(sed -nr 's|^abcde: (.+) to aa://.+$|\1|p' ./.github/workflows/log.txt))
echo "upload_files : " "${upload_files[@]}"
combine=("${upload_files[@]}" "$@")
echo "combine : " "${combine[@]}"
diff=($( (printf '%s\n' "${combine[@]}" | sort -u; printf '%s\n' "${upload_files[@]}") | sort | uniq -u))
echo "diff : " "${diff[@]}"

for file in "${diff[@]}"; do
    echo "${file}"
done
