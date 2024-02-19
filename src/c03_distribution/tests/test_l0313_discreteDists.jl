using c03_distribution: summarizeDistributions
using Distributions
using Test
@testset "end_to_end" begin
    dists = [
        DiscreteUniform(10,20),
        Binomial(10,0.5),
        Geometric(0.5),
        NegativeBinomial(10,0.5),
        Hypergeometric(30, 40, 10),
        Poisson(5.5),
    ]
    result = summarizeDistributions(dists)
    expected_result =  Any[
        DiscreteUniform(10,20) (10, 20) (10, 20);
        Binomial(10,0.5) (10, 0.5) (0, 10);
        Geometric(0.5) (0.5,) (0, Inf);
        NegativeBinomial(10,0.5) (10.0, 0.5) (0, Inf);
        Hypergeometric(30, 40, 10) (30, 40, 10) (0, 10);
        Poisson(5.5) (5.5,) (0, Inf)
        ]
    @test result == expected_result
end