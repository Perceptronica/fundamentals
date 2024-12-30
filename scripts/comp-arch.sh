#!/bin/bash

# COMPUTER ARCHITECTURE + OS

urls=(
    "https://shuyuej.com/books/Computer%20Systems-%20A%20Programmer%27s%20Perspective.pdf"
    "https://techiefood4u.wordpress.com/wp-content/uploads/2020/02/operating_systems_three_easy_pieces.pdf"
)

target_dir="books/comp-arch"

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
