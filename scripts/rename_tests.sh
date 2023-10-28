# find all scripts and prepend test_ to the name
# e.g. mv ./test_c09_machine_learning/l0912_kMeansManual.jl ./test_c09_machine_learning/test_l0912_kMeansManual.jl
find . -type f -name "*.jl" -exec bash -c 'mv "$1" "$(dirname "$1")/test_$(basename "$1")"' _ {} \;
find . -type f -name "*.py" -exec bash -c 'mv "$1" "$(dirname "$1")/test_$(basename "$1")"' _ {} \;