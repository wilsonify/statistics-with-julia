
using Random
using Distributions
using StatsPlots
using Measures
using Plots; gr()
using StatisticsWithJulia.c04_data: generate_beta_data

@testset "generate_beta_data test" begin
    Random.seed!(0)
    n = 2000
    b1 = 0.5
    b2 = 2
    data1 = generate_beta_data(n, b1, b1)
    @test length(data1) == n
    @test typeof(data1) == Vector{Float64}
end

@testset "plot hist" begin
    Random.seed!(0)
    n = 2000
    b1 = 0.5
    b2 = 2
    data1 = generate_beta_data(n, b1, b1)
    data2 = generate_beta_data(n, b2, b2)
    stephist(data1, bins = 15, label = "beta($b1,$b1)", c = :red, normed = true)
    p1 = stephist!(data2,
        bins = 15,
        label = "beta($b2,$b2)",
        c = :blue,
        xlabel = "x",
        ylabel = "Density",
        normed = true)
    p2 = qqplot(data1,
        data2,
        c = :black,
        ms = 1,
        msw = 0,
        xlabel = "Quantiles for beta($b1,$b1) sample",
        ylabel = "Quantiles for beta($b2,$b2) sample",
        legend = false)
    plot(p1, p2, size = (800, 400), margin = 5mm)
end