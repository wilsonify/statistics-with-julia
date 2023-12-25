# Classic vs. smooth histograms
#=
Lines 4–8 deal with the mixture random variable.
It is a mixture of two normal distributions,
each with parameters as specified in lines 4–5.
The mixture places a probability of p = 0.3
of being from the first distribution and hence a probability of 0.7 of being from the second.
Line 8 defines the function that generates the mixture random variable.
It evaluates to rand(dist1) with probability 0.3 and rand(dist2) with probability 0.7.
Lines 10–11 generate data samples from this mixture distribution.
Lines 13–14 create the density plot. Lines 15–16 plot a histogram for comparison.
=#
using Random
using Distributions
using StatsPlots

function main_l0415_statsPlotsDensity()
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)

    n = 2000
    data = [mixRv() for _ in 1:n]

    density(data, c = :blue, label = "Density via StatsPlots", xlims = (-20,80), ylims = (0,0.035))
    stephist!(data, bins = 50, c = :black, norm = true, label = "Histogram", xlabel = "x", ylabel = "Density")
end

using Random
using Distributions
using StatsPlots

# Define a custom function to generate the test data
function generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    return [mixRv() for _ in 1:n]
end

using Test
@testset "generate_mixture_data Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    @test length(data) == n
    @test typeof(data) == Vector{Float64}
end
@testset "Density Plot Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    density_plot = density(data,
        c = :blue,
        label = "Density via StatsPlots",
        xlims = (-20, 80),
        ylims = (0, 0.035))
end

@testset "Histogram Plot Test" begin
    Random.seed!(0)
    n = 2000
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    histogram_plot = stephist!(data,
        bins = 50,
        c = :black,
        norm = true,
        label = "Histogram",
        xlabel = "x",
        ylabel = "Density")
end
