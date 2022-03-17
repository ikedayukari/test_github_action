#!/usr/bin/env bash

diff_files=$(echo "${1}" | tr ' ' '\n')

upload_files=$(sed -nr 's|^abcde: (.+) to aa://.+$|\1|p' ./.github/workflows/log.txt)
echo "upload_files :" "${upload_files}"

combine="${upload_files}
${diff_files}"
echo "combine :" "${combine}"

diff=($( (echo "${combine}" | sort -u; echo "${upload_files}") | sort | uniq -u))
echo "diff :" "${diff[@]}"

for file in "${diff[@]}"; do
    echo "${file}"
done
