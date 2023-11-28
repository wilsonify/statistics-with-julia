# Families of continuous distributions
using StatisticsWithJulia: summarize_dist
using StatisticsWithJulia: range_of_dist
using Distributions
using Test
dists = [
    Uniform(10,20),
    Exponential(3.5),
    Gamma(0.5,7),
    Beta(10,0.5),
    Weibull(10,0.5),
    Normal(20,3.5),
    Rayleigh(2.4),
    Cauchy(20,3.5)
    ]

@testset "range_of_dist" begin
    range_of_dist.(dists)
end
@testset "summarize_dist" begin
    summarize_dist.(dists)
end

@testset "end_to_end" begin
    reshape([dists ; params.(dists) ; ((d)->(minimum(d),maximum(d))).(dists) ], length(dists),3)
end