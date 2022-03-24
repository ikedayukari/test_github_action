#!/usr/bin/env bash

if [ -s test.txt ]; then
  curl -s -X POST "https://api.chatwork.com/v2/rooms/${ROOM_ID}/files" \
    -H "X-ChatWorkToken: ${ABCDEF}" \
    -F "file=@test.txt" \
    -F "message="@- <<EOS
  【 ブランチ：${BRANCH} 】
  ${MESSAGE}(${AUTHOR})
EOS
else
  curl -s -X POST "https://api.chatwork.com/v2/rooms/${ROOM_ID}/messages" \
    -H "X-ChatWorkToken: ${ABCDEF}" \
    -d "body="@- <<EOS
  ${MESSAGE}(${AUTHOR})
EOS
fi