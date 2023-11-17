#!
# You want to plan an experiment or a sampling scheme such that margin of error, E, is not too wide.
# For example, “not more than 0.1”. For this, you need to choose a sample size n prior to sampling.
!#
using Test

proportions_sample_size_formula(eps) = ceil(1 / eps^2)

for eps in [0.1, 0.05, 0.02, 0.01]
    println("For epsilon = $eps")
    n = proportions_sample_size_formula(eps)
    println("set n = $n")
end

@testset "" begin
    n = proportions_sample_size_formula(0.02)
    @test n == 2500
end
