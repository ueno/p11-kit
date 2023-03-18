#!/bin/sh

: ${DATA=$(dirname "$0")}
: ${UNCRUSTIFY=uncrustify}

if ! "$UNCRUSTIFY" --version 2>&1 >/dev/null; then
    echo "Uncrustify is not installed on your system."
    exit 1
fi

# Aligning prototypes is not working yet, so avoid headers
git ls-files | grep '\.c\(.in\)\?$' | while read file; do
    "$UNCRUSTIFY" -c "$DATA/uncrustify.cfg" --no-backup "$file"
    "$DATA/lineup-parameters" "$file" > "$file.temp" && mv "$file.temp" "$file"
done
