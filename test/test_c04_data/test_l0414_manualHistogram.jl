using Distributions, Random
using Plots; gr()
function generate_data(n::Int, seed::Int = 0)
    Random.seed!(seed)
    return rand(Normal(), n)
end

function create_bins(data::Vector{Float64}, delta::Float64)
    l, m = minimum(data), maximum(data)
    bins = [(x, x + delta) for x in l:delta:(m - delta)]
    if last(bins)[2] < m
        push!(bins, (last(bins)[2], m))
    end
    return bins
end

function compute_histogram(data::Vector{Float64}, bins::Vector{Tuple{Float64, Float64}})
    L = length(bins)
    inBin(x, j) = first(bins[j]) <= x && x < last(bins[j])
    sizeBin(j) = last(bins[j]) - first(bins[j])
    f(j) = sum([inBin(x, j) for x in data]) / length(data)
    h(x) = sum([f(j) / sizeBin(j) * inBin(x, j) for j in 1:L])
    return h
end

function main_manual_histogram()
    n = 2000
    data = generate_data(n, 0)
    delta = 0.3
    true_pdf = pdf.(Normal(), -4:0.01:4)
    #plot_histogram(data, delta, true_pdf)
end

using Test

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

function plot_histogram(data)
    delta = 0.3
    xGrid = -4:0.01:4
    bins = create_bins(data, delta)
    h = compute_histogram(data, bins)
    L = length(bins)
    histogram(data,
        normed = true,
        bins = L,
        label = "Built-in histogram",
        c = :blue,
        la = 0,
        alpha = 0.6)
    plot!(xGrid,
        h.(xGrid),
        lw = 3,
        c = :red,
        label = "Manual histogram",
        xlabel = "x",
        ylabel = "Frequency")
    plot!(xGrid,
        pdf.(Normal(), xGrid),
        label = "True PDF",
        lw = 3,
        c = :green,
        xlims = (-4, 4),
        ylims = (0, 0.5))
end

@testset "plot_histogram test" begin
    n = 2000
    data = generate_data(n)
    true_pdf = pdf.(Normal(), -4:0.01:4)
    plot_histogram(data)
end
