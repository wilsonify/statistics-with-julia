# Normal probability plot

using Random
using Distributions
using StatsPlots
using Plots; gr()

function generate_normal_data(n, mu, sigma)
    dist = Normal(mu, sigma)
    data = rand(dist, n)
    return data
end

function generate_exponential_data(n, lambda)
    dist = Exponential(lambda)
    data = rand(dist, n)
    return data
end

function main_l0418_normalProbabilityPlot()
    Random.seed!(0)

    mu = 20
    d1, d2 = Normal(mu,mu), Exponential(mu)

    n = 100
    # The distributions for the two synthetic datasets are defined in lines 4–5.
    # You can check that they have the same theoretical mean and variance
    # by using mean() and var() on d1 and d2.

    data1 = rand(d1,n)
    data2 = rand(d2,n)

    # then plot the normal probability plots
    # via the qqnorm() and qqnorm!() functions from StatsPlots.
    # The second function has a ! in the name
    # similar to other plotting functions that add onto an existing plot.
    qqnorm(data1, c = :blue, ms = 3, msw = 0, label = "Normal Data")
    qqnorm!(data2, c = :red, ms = 3, msw = 0, label = "Exponential Data", xlabel = "Normal Theoretical Quantiles", ylabel = "Data Quantiles", legend = true)
end

using Random
using Distributions
using StatsPlots
using Plots; gr()
using Test

@testset "generate_normal_data" begin
    n = 100
    result = generate_normal_data(n, 20, 20)
    @test length(result) == n
    @test typeof(result) == Vector{Float64}
end

@testset "qq plot" begin
    Random.seed!(0)
    mu = 20
    sigma = 20
    n = 100
    d1 = Normal(mu, sigma)
    d2 = Exponential(mu)
    data1 = rand(d1, n)
    data2 = rand(d2, n)
    qqnorm(data1, c = :blue, ms = 3, msw = 0, label = "Normal Data")
    qqnorm!(data2,
        c = :red,
        ms = 3,
        msw = 0,
        label = "Exponential Data",
        xlabel = "Normal Theoretical Quantiles",
        ylabel = "Data Quantiles",
        legend = true)
end
