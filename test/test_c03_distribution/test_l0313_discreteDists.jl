using StatisticsWithJulia: summarizeDistributions
using Distributions
using Test
@testset "end_to_end" begin
    dists = [
        DiscreteUniform(10,20),
        Binomial(10,0.5),
        Geometric(0.5),
        NegativeBinomial(10,0.5),
        Hypergeometric(30, 40, 10),
        Poisson(5.5)
    ]
    result = summarizeDistributions(dists)
    expected_result =  Any[
        DiscreteUniform(a=10, b=20) (10, 20) (10, 20);
        Binomial{Float64}(n=10, p=0.5) (10, 0.5) (0, 10);
        Geometric{Float64}(p=0.5) (0.5,) (0, Inf);
        NegativeBinomial{Float64}(r=10.0, p=0.5) (10.0, 0.5) (0, Inf);
        Hypergeometric(ns=30, nf=40, n=10) (30, 40, 10) (0, 10);
        Poisson{Float64}(λ=5.5) (5.5,) (0, Inf)
        ]
    @test result == expected_result
end