# Classic vs. smooth histograms

using Random
using Distributions
using StatsPlots

# Define a custom function to generate the test data
function generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)
    # It is a mixture of two normal distributions
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    # defines the function that generates the mixture random variable.
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    # evaluate to rand(dist1) with probability p and rand(dist2) with probability 1-p.
    return [mixRv() for _ in 1:n]
end


function main_l0415_statsPlotsDensity()
    # deal with the mixture random variable.
    n = 2000
    Random.seed!(0)
    # specify parameters
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    # The mixture places a probability of p = 0.3
    # of being from the first distribution and hence a probability of 0.7 of being from the second.
    p = 0.3

    data = generate_mixture_data(n, mu1, sigma1, mu2, sigma2, p)

    # generate data samples from this mixture distribution.
    density(data, c = :blue, label = "Density via StatsPlots", xlims = (-20,80), ylims = (0,0.035))

    # create the density plot. Lines 15–16 plot a histogram for comparison.
    stephist!(data, bins = 50, c = :black, norm = true, label = "Histogram", xlabel = "x", ylabel = "Density")
end

using Random
using Distributions
using StatsPlots


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
