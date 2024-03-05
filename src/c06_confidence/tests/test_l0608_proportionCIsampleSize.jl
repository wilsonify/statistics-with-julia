#=
You want to plan an experiment such that margin of error is not too wide.
For example, “not more than 0.1”.
you need to choose a sample size n prior to sampling.
=#

using Test
using c06_confidence: proportions_sample_size

@testset "" begin
    n = proportions_sample_size(0.02)
    @test n == 2500
end

@testset "loop" begin
    for eps in [0.1, 0.05, 0.02, 0.01]
        println("For epsilon = $eps")
        n = proportions_sample_size(eps)
        println("set n = $n")
    end
end