#!/bin/bash

chmod +x scripts/*

scripts=(
    "scripts/ml-dl.sh"
    "scripts/comp-arch.sh"
    "scripts/c.sh"
    "scripts/python.sh"
)

for script in "${scripts[@]}"; do
    if [[ -f "$script" ]]; then
        bash "$script"
    fi
done
