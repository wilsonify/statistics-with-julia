# Creating a manual histogram
#=
In lines 4–6,
we deal with the data.
It is artificially sampled from a standard normal distribution.
Lines 8–13
detail our choice of bins.
In this case, L is implicitly defined based on the bin width delta.
in line 11
The statement is executed when l-m is not a multiple of delta
and adds an additional final bin (potentially smaller than the rest of the bins).
The function inBin() implements 1{x ∈ B j }.
The function sizeBin() implements |B j |.
The function f() implements f j as in (4.6).
We then use these in line 18 to implement h(x) as in the first representation of (4.7).
Lines 21–23
plot the histogram using histogram() where we specify L bins.
Lines 24–25
plot our manual implementation of the histogram via h().
For comparison,
we also plot the PDF of the data
in lines 26–27.
=#
using Distributions, Random
using Plots; gr()

function main_l0414_manualHistogram()
    Random.seed!(0)

    n = 2000
    data = rand(Normal(),n)
    l, m = minimum(data), maximum(data)

    delta = 0.3;
    bins = [(x,x + delta) for x in l:delta:m - delta]
    if last(bins)[2] < m
        push!(bins,(last(bins)[2],m))
    end
    L = length(bins)

    inBin(x, j) = first(bins[j]) <= x && x < last(bins[j])
    sizeBin(j) = last(bins[j]) - first(bins[j])
    f(j) = sum([inBin(x,j)  for x in data]) / n
    h(x) = sum([f(j) / sizeBin(j) * inBin(x,j) for j in 1:L])

    xGrid = -4:0.01:4
    histogram(data,normed=true, bins=L,
        label="Built-in histogram",
        c=:blue, la=0, alpha=0.6)
    plot!(xGrid,h.(xGrid), lw=3, c=:red, label="Manual histogram",
        xlabel="x",ylabel="Frequency")
    plot!(xGrid,pdf.(Normal(),xGrid),label="True PDF",
        lw=3, c=:green, xlims=(-4,4), ylims=(0,0.5))
end

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
