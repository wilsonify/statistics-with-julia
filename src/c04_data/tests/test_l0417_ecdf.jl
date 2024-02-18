using Random
using Distributions
using StatsBase
using StatisticsWithJulia.c04_data: generate_mixture_data_ecdf, plot_mixCDF
using Plots; gr()
using Test

@testset "generate_mixture_data_ecdf Test" begin
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    n1 = 30
    n2 = 100

    data1 = generate_mixture_data_ecdf(n1, mu1, sigma1, mu2, sigma2, p)
    @test length(data1) == n1
    @test typeof(data1) == Vector{Float64}

    data2 = generate_mixture_data_ecdf(n2, mu1, sigma1, mu2, sigma2, p)
    @test length(data2) == n2
    @test typeof(data2) == Vector{Float64}
end

# Define a test for ECDF plots
@testset "ECDF Plot Test" begin
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    p = 0.3
    n1 = 30
    n2 = 100
    xGrid = -10:0.1:80

    data1 = generate_mixture_data_ecdf(n1, mu1, sigma1, mu2, sigma2, p)
    data2 = generate_mixture_data_ecdf(n2, mu1, sigma1, mu2, sigma2, p)
    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)
    ecdf_plot = plot(xGrid, empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $n1")
    plot!(xGrid, empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $n2")
    plot_mixCDF(n2, mu1, sigma1, mu2, sigma2, p)
end

function main_ecdf()
    Random.seed!(0)
    mu1, sigma1 = 10, 5
    mu2, sigma2 = 40, 12
    dist1, dist2 = Normal(mu1, sigma1), Normal(mu2, sigma2)
    p = 0.3
    mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
    mixCDF(x) = p * cdf(dist1, x) + (1 - p) * cdf(dist2, x)
    n = [30, 100]
    data1 = [mixRv() for _ in 1:n[1]]
    data2 = [mixRv() for _ in 1:n[2]]

    empiricalCDF1 = ecdf(data1)
    empiricalCDF2 = ecdf(data2)
    xGrid = -10:0.1:80
    plot(xGrid, empiricalCDF1.(xGrid), c = :blue, label = "ECDF with n = $(n[1])")
    plot!(xGrid, empiricalCDF2.(xGrid), c = :red, label = "ECDF with n = $(n[2])")
    plot!(xGrid,
        mixCDF.(xGrid),
        c = :black,
        label = "Underlying CDF",
        xlims = (-10, 80),
        ylims = (0, 1),
        xlabel = "x",
        ylabel = "Probability",
        legend = :topleft)
end
