# Inverse transform sampling
# For large N, the histogram is a close approximation of the PDF of the underlying distribution.
using Distributions, Plots

function main_l0312_triangularDistInv()
    # create triangular distribution
    triangDist = TriangularDist(0,2,1)
    # define the support to plot our data
    xGrid = 0:0.1:2
    N = 10^6
    # generate random observations from a continuous uniform distribution over the domain [0, 1]
    uniform_sample=rand(N)
    # calculate each corresponding quantile of triangDist
    inverseSampledData = quantile.(triangDist,uniform_sample)
    # For large N, the histogram is a close approximation of the PDF of the underlying distribution.
    y1 = pdf.(triangDist,xGrid)
    # plot a histogram of this inverseSampledData using 30 bins
    histogram( inverseSampledData, bins = 30, normed = true, ylims = (0,1.1), label = "Inverse transform data")
    # plot the analytic PDF of the underlying distribution.
    plot!( xGrid, y1, c = :red, lw = 4, xlabel = "x", label = "PDF", ylabel = "Density", legend = :topright)
end

