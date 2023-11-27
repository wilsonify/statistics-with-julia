using Random, Distributions, StatsPlots, Plots; gr()

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
