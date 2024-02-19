# The law of large numbers breaks down with very heavy tails
using c03_distribution: generate_cauchy_data
using c03_distribution: running_proportion
using Random, Plots
using Test

@testset "generate_cauchy_data" begin
    n = 10^3
    data = generate_cauchy_data(n)
    @test length(data) == n
end

@testset "running_proportion" begin
    n = 10^6
    data = tan.(rand(n) * pi .- pi / 2)
    averages = running_proportion(data)
    @test length(averages) == n
end

@testset "end_to_end" begin
    n = 10^6
    data = generate_cauchy_data(n)
    averages = running_proportion(data)
    plot( 1:n, averages,  c = :blue, legend = :none, xscale = :log10, xlims = (1,n), xlabel = "n", ylabel = "Running average")
end