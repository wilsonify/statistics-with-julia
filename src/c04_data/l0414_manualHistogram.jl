# Creating a manual histogram

using Distributions
using Random
using Plots; gr()

function generate_data(n::Int, seed::Int = 0)
    # data artificially sampled from a standard normal distribution.
    Random.seed!(seed)
    return rand(Normal(), n)
end

function create_bins(data::Vector{Float64}, delta::Float64)
    # detail our choice of bins.
    l, m = minimum(data), maximum(data)
    bins = [(x, x + delta) for x in l:delta:(m - delta)]
    # The statement is executed when l-m is not a multiple of delta
    if last(bins)[2] < m
        # and adds an additional final bin (potentially smaller than the rest of the bins).
        push!(bins, (last(bins)[2], m))
    end
    return bins
end

function compute_histogram(data::Vector{Float64}, bins::Vector{Tuple{Float64, Float64}})
    L = length(bins)
    # The function inBin() implements 1{x ∈ B j }.
    inBin(x, j) = first(bins[j]) <= x && x < last(bins[j])
    # The function sizeBin() implements |B j |.
    sizeBin(j) = last(bins[j]) - first(bins[j])
    # The function f() implements f j as in (4.6).
    f(j) = sum([inBin(x, j) for x in data]) / length(data)
    # We then use these in line 18 to implement h(x) as in the first representation of (4.7).
    h(x) = sum([f(j) / sizeBin(j) * inBin(x, j) for j in 1:L])
    return h
end

function plot_histogram(data)
    delta = 0.3
    xGrid = -4:0.01:4
    bins = create_bins(data, delta)
    h = compute_histogram(data, bins)
    L = length(bins)
    y1 = h.(xGrid)
    true_pdf = pdf.(Normal(), xGrid)
    # plot the histogram using histogram() where we specify L bins.
    histogram(data, normed = true, bins = L, label = "Built-in histogram", c = :blue, la = 0, alpha = 0.6)
    # plot our manual implementation of the histogram via h().
    plot!(xGrid, y1, lw = 3, c = :red, label = "Manual histogram", xlabel = "x", ylabel = "Frequency")
    # For comparison, we also plot the PDF of the data
    plot!(xGrid, true_pdf, label = "True PDF", lw = 3, c = :green, xlims = (-4, 4), ylims = (0, 0.5))
end

function main_l0414_manualHistogram()
    Random.seed!(0)
    n = 2000
    delta = 0.3; # bin width delta
    data = generate_data(n, 0)
    l, m = minimum(data), maximum(data)
    bins = create_bins(data, delta)
    L = length(bins)
    h = compute_histogram(data, bins)
    xGrid = -4:0.01:4
    y1 = h.(xGrid)
    true_pdf = pdf.(Normal(), -4:0.01:4)
    plot_histogram(data)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0414_manualHistogram()
end


export generate_data
export create_bins
export compute_histogram
export plot_histogram


