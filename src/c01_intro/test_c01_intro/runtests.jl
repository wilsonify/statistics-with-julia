# using Base.Filesystem
#
# dir_path = @__DIR__
#
# function should_include(file::String)::Bool
#     # Filter to "test_*.jl"
#     current_file::String = @__FILE__
#     starts_with_test::Bool = startswith(file, "test_")
#     ends_with_jl::Bool = endswith(file, ".jl")
#     not_this_file::Bool = file ≠ current_file
#     return ends_with_jl && starts_with_test && not_this_file
# end
#
# all_files = readdir(dir_path)
# test_files = filter(should_include, all_files)
#
# for file in test_files
#     include(file)
# end


include("$(@__DIR__)/test_l0101_helloWorld.jl")
include("$(@__DIR__)/test_l0102_comprehension.jl")
include("$(@__DIR__)/test_l0103_slow.jl")
include("$(@__DIR__)/test_l0104_fast.jl")
include("$(@__DIR__)/test_l0105_scope.jl")
include("$(@__DIR__)/test_l0106_bubbleSort.jl")
include("$(@__DIR__)/test_l0107_polyRoots.jl")
include("$(@__DIR__)/test_l0108_multiWayMarkovChainStationary.jl")
include("$(@__DIR__)/test_l0110_plotSimple.jl")
include("$(@__DIR__)/test_l0111_hailstoneHistogram.jl")
include("$(@__DIR__)/test_l0113_imageProcessing.jl")
include("$(@__DIR__)/test_l0112_graph.jl")
include("$(@__DIR__)/test_l0114_seedExample.jl")
include("$(@__DIR__)/test_l0115_piEstimate.jl")
include("$(@__DIR__)/test_l0116_lcg.jl")
include("$(@__DIR__)/test_l0117_randomWalks.jl")
include("$(@__DIR__)/test_l0121_usingC.jl")
