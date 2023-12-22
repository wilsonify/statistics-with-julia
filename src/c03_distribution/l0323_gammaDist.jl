# Gamma random variable as a sum of exponentials

using Distributions, Plots; gr()

function normalizedData(d::Gamma)
    # operates on a gamma distribution as specified via ::Gamma.
    # The function obtains the shape parameter of the input distribution via shape() and converts this to an integer.
    # Then -log.(rand(sh)) is a raw way of generating a unit mean collection of
    # exponential random variables using the inverse probability transform.
    # These are then scaled by the scalar, (1/(sh*lambda)).
    lambda, N = 1 / 3, 10^5
    sh = Int64(shape(d))
    data = [sum(-(1 / (sh*lambda)) * log.(rand(sh))) for _ in 1:N]
end

function main_l0323_gammaDist()
    lambda, N = 1 / 3, 10^5
    # create the array bulbs which stores the number of bulbs for each case.
    bulbs = [1, 10, 50]
    xGrid = 0:0.1:10
    # create a gamma distribution for each of our cases.
    dists = [Gamma(n,1 / (n*lambda)) for n in bulbs]
    y1 = normalizedData.(dists)
    y2 = [pdf.(i,xGrid) for i in dists]

    # plot the histograms and the actual PDFs.

    # create an array of colors which are used later for formatting the plots.
    C = [:blue :red :green]
    # generate the string array L used for the legend.
    L = [ "Shape = "*string.(shape.(i)) * ", Scale = "* string.(round.(scale.(i),digits = 2)) for i in dists ]

    stephist( y1, bins = 50, normed = :true, c = C, xlims = (0,maximum(xGrid)),ylims = (0,1), xlabel = "x", ylabel = "Density", label = "")
    plot!(xGrid, y1, c = C, label = reshape(L, 1,:))
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0323_gammaDist()
end