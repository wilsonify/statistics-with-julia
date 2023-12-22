# The Box-Muller transform
using Random, Distributions, Plots; gr()

# the Box-Muller transform generates a single standard normal random variable.
Z() = sqrt(-2 * log(rand())) * cos(2 * pi*rand())

function main_l0329_normalDistribution()
    # plot a histogram and compares the standard normal PDF.
    # Notice the use of the L macro for latex formatting
    xGrid = -4:0.01:4
    y1 = [Z() for _ in 1:10^6]
    y2 = pdf.(Normal(),xGrid)
    histogram(y1, bins = 50, normed = true, label = "MC estimate")
    plot!(xGrid, y2, c = :red, lw = 4, label = "PDF", xlims = (-4,4), ylims = (0,0.5), xlabel = "x", ylabel = "f(x)" )
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0329_normalDistribution()
end

export Z
export main_l0329_normalDistribution
