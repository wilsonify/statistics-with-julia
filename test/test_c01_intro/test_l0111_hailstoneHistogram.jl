using Plots; pyplot()

function hailLength(x::Int)
    n = 0
    while x != 1
        if x % 2 == 0
            x = Int(x / 2)
        else
            x = 3x + 1
        end
        n += 1
    end
    return n
end

function generate_hailstone_lengths(limit)
    lengths = [hailLength(x0) for x0 in 2:limit]
    return lengths
end

function plot_hailstone_lengths(lengths, num_bins)
    histogram(lengths, bins = num_bins, normed = :true,
        fill = (:blue, true), la = 0, legend = :none,
        xlims = (0, 500), ylims = (0, 0.012),
        xlabel = "Length", ylabel = "Frequency")
end

function main()
    limit = 10^7
    hailstone_lengths = generate_hailstone_lengths(limit)
    num_bins = 1000
    plot_hailstone_lengths(hailstone_lengths, num_bins)
end

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
    @test typeof(p) == Plots.Plot{Plots.PyPlotBackend}
end
