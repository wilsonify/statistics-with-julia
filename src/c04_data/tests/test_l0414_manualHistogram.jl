using Distributions
using Random
using Plots; gr()
using Test
using c04_data: generate_data
using c04_data: create_bins
using c04_data: compute_histogram
using c04_data: plot_histogram


@testset "generate_data test" begin
    n = 2000
    data = generate_data(n)
    @test length(data) == n
    @test typeof(data) == Vector{Float64}
end

@testset "create_bins test" begin
    data = [1.0, 2.0, 2.5, 3.0, 4.0]
    delta = 0.5
    bins = create_bins(data, delta)
    @test bins == [(1.0, 1.5), (1.5, 2.0), (2.0, 2.5), (2.5, 3.0), (3.0, 3.5), (3.5, 4.0)]
end

@testset "compute_histogram test" begin
    data = [1.5, 2.5, 2.0, 3.0, 4.0]
    delta = 0.5
    bins = create_bins(data, delta)
    h = compute_histogram(data, bins)
    @test h(1.25) == 0.0
    @test h(2.25) == 0.4
    @test h(3.25) == 0.4
end

@testset "plot_histogram test" begin
    n = 2000
    data = generate_data(n)
    true_pdf = pdf.(Normal(), -4:0.01:4)
    plot_histogram(data)
end
