using Random
using Distributions
using StatsPlots
using StatisticsWithJulia.c04_data: generate_mixture_data

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
