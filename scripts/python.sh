#!/bin/bash

# PYTHON LANGUAGE

urls=(
    "https://elmoukrie.com/wp-content/uploads/2022/05/luciano-ramalho-fluent-python_-clear-concise-and-effective-programming-oreilly-media-2022.pdf"
    "https://books-library.net/files/books-library.net-11301954Yq8A7.pdf"
    "https://beej.us/guide/bgpython/pdf/bgpython_a4_c_1.pdf"
)

target_dir="books/python"

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
