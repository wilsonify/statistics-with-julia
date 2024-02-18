using StatisticsWithJulia.c03_distribution: generate_exp_data
using StatisticsWithJulia.c03_distribution: process_exp_data
using StatisticsWithJulia.c03_distribution: get_proportions
using StatisticsWithJulia.c03_distribution: generate_matching_geom_data

using StatsBase, Distributions, Plots; gr()
using Test

@testset "generate_exp_data" begin
    lambda, N = 1, 10^3
    exp_sample = generate_exp_data(lambda, N)
    @test length(exp_sample) == N
end

@testset "process_exp_data" begin
    lambda, N = 1, 10^3
    exp_sample = generate_exp_data(lambda, N)
    result = process_exp_data(exp_sample)
    @test length(result) == N
end

@testset "get_proportions" begin
    lambda, N = 1, 10^3
    xGrid = 0:6
    exp_sample = generate_exp_data(lambda, N)
    exp_sample_floored_int = process_exp_data(exp_sample)
    floorDataCounts = get_proportions(exp_sample_floored_int,xGrid)
end

@testset "end_to_end" begin
    lambda, N = 1, 10^3
    xGrid = 0:6
    exp_sample = generate_exp_data(lambda, N)
    exp_sample_floored_int = process_exp_data(exp_sample)
    floorDataCounts = get_proportions(exp_sample_floored_int, xGrid)
    geomDistPdfData = generate_matching_geom_data(lambda,xGrid)
    plot( xGrid, floorDataCounts, line = :stem, marker = :circle, c = :blue, ms = 10, msw = 0, lw = 4, label = "Floor of Exponential")
    plot!( xGrid, geomDistPdfData, line = :stem, marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "Geometric", ylims = (0,1), xlabel = "x", ylabel = "Probability")
end