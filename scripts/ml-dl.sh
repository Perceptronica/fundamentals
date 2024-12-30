#!/bin/bash

# MACHINE LEARNING + DEEP LEARNING

urls=(
    "https://mml-book.github.io/book/mml-book.pdf"
    "https://raw.githubusercontent.com/janishar/mit-deep-learning-book-pdf/master/complete-book-bookmarked-pdf/deeplearningbook.pdf"
)

target_dir="books/ml-dl"

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
