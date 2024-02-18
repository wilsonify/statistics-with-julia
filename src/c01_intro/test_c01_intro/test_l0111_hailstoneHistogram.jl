
using StatisticsWithJulia.c01_intro: hailLength
using StatisticsWithJulia.c01_intro: generate_hailstone_lengths
using StatisticsWithJulia.c01_intro: plot_hailstone_lengths
using Test

# Define a test for the hailLength function
@testset "Test hailLength function" begin
    @test hailLength(2) == 1
    @test hailLength(3) == 7
    @test hailLength(6) == 8
end

# Define a test for the generate_hailstone_lengths function
@testset "Test generate_hailstone_lengths function" begin
    limit = 10
    lengths = generate_hailstone_lengths(limit)
    @test length(lengths) == limit - 1
end

# Define a test for the plot_hailstone_lengths function
@testset "Test plot_hailstone_lengths function" begin
    limit = 100
    hailstone_lengths = generate_hailstone_lengths(limit)
    num_bins = 10
    p = plot_hailstone_lengths(hailstone_lengths, num_bins)
    @test typeof(p) == Plots.Plot{Plots.GRBackend}
end
