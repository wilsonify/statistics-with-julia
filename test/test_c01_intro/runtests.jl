using Test

@time @testset "smoke Test" begin
    @test true
end

# @time @testset "l0112_graph.jl Tests" begin
#     include("$(@__DIR__)/test_l0112_graph.jl")
# end

@time @testset "l0101_helloWorld.jl Tests" begin
    include("$(@__DIR__)/test_l0101_helloWorld.jl")
end

@time @testset "l0102_comprehension.jl Tests" begin
    include("$(@__DIR__)/test_l0102_comprehension.jl")
end

@time @testset "l0103_slow.jl Tests" begin
    include("$(@__DIR__)/test_l0103_slow.jl")
end

# @time @testset "l0104_fast.jl Tests" begin
#     include("$(@__DIR__)/test_l0104_fast.jl")
# end
# @time @testset "l0105_scope.jl Tests" begin
#     include("$(@__DIR__)/test_l0105_scope.jl")
# end
# @time @testset "l0106_bubbleSort.jl Tests" begin
#     include("$(@__DIR__)/test_l0106_bubbleSort.jl")
# end
# @time @testset "l0107_polyRoots.jl Tests" begin
#     include("$(@__DIR__)/test_l0107_polyRoots.jl")
# end
# @time @testset "l0108_multiWayMarkovChainStationary.jl Tests" begin
#     include("$(@__DIR__)/test_l0108_multiWayMarkovChainStationary.jl")
# end
# @time @testset "l0110_plotSimple.jl Tests" begin
#     include("$(@__DIR__)/test_l0110_plotSimple.jl")
# end
# @time @testset "l0111_hailstoneHistogram.jl Tests" begin
#     include("$(@__DIR__)/test_l0111_hailstoneHistogram.jl")
# end
# @time @testset "l0113_imageProcessing.jl Tests" begin
#     include("$(@__DIR__)/test_l0113_imageProcessing.jl")
# end
# @time @testset "l0114_seedExample.jl Tests" begin
#     include("$(@__DIR__)/test_l0114_seedExample.jl")
# end
# @time @testset "l0115_piEstimate.jl Tests" begin
#     include("$(@__DIR__)/test_l0115_piEstimate.jl")
# end
# @time @testset "l0116_lcg.jl Tests" begin
#     include("$(@__DIR__)/test_l0116_lcg.jl")
# end
# @time @testset "l0117_randomWalks.jl Tests" begin
#     include("$(@__DIR__)/test_l0117_randomWalks.jl")
# end
#
