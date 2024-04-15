#! /bin/bash

slug="$1"
if [ -z "$slug" ]; then
    echo "Usage: $0 PROVIDER_SLUG" >&2
    exit 1
fi

cp "client_id.${slug}.txt" client_id.txt
cp "client_secret.${slug}.txt" client_secret.txt
cp "client_metadata.${slug}.txt" client_metadata.txt

