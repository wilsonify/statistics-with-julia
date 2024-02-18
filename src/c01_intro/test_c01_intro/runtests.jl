using Base.Filesystem

dir_path = @__DIR__

function should_include(file::String)::Bool
    # Filter to "test_*.jl"
    current_file::String = @__FILE__
    starts_with_test::Bool = startswith(file, "test_")
    ends_with_jl::Bool = endswith(file, ".jl")
    not_this_file::Bool = file ≠ current_file
    return ends_with_jl && starts_with_test && not_this_file
end

all_files = readdir(dir_path)
test_files = filter(should_include, all_files)

for file in test_files
    include(file)
end
