#!/bin/bash

# C LANGUAGE

urls=(
    "https://beej.us/guide/bgc/pdf/bgc_a4_c_1.pdf"
    "https://beej.us/guide/bgclr/pdf/bgclr_a4_c_1.pdf"
)

target_dir="books/c"

mkdir -p "$target_dir"

download_file() {
    url=$1
    file_name=$(basename "$url")

    if [ -e "$target_dir/$file_name" ]; then
        echo "skipping $file_name"
    else
        wget -q -P "$target_dir" "$url"
        if [ $? -eq 0 ]; then
            echo "downloaded $file_name"
        else
            echo "error! $file_name"
        fi
    fi
}

for url in "${urls[@]}"; do
    download_file "$url"
done
