# Histogram of hailstone sequence lengths
using Plots; gr()


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

function main_hailstone_histogram()
    limit = 10^7
    hailstone_lengths = generate_hailstone_lengths(limit)
    num_bins = 1000
    plot_hailstone_lengths(hailstone_lengths, num_bins)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_hailstone_histogram()
end

export hailLength
export generate_hailstone_lengths
export plot_hailstone_lengths
