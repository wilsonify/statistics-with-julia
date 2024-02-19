#!/bin/bash

# Define the list of directories
directories=(
    "../src/io_library"
    "../src/testing_library"
    "../src/c01_intro"
    "../src/c02_probability"
    "../src/c03_distribution"
    "../src/c04_data"
    "../src/c05_inference"
    "../src/c06_confidence"
    "../src/c07_hypothesis"
    "../src/c08_regression"
    "../src/c09_machine_learning"
    "../src/c10_simulation"
)

# Loop through each directory
for dir in "${directories[@]}"; do
    # Change directory
    cd "$dir" || exit 1

    # Execute dev.jl in the current directory
    julia --project=~/.julia/environments/v1.5 dev.jl

    # Go back to the original directory
    cd - || exit 1
done
