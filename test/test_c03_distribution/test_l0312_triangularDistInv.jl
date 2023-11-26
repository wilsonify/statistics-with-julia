# Inverse transform sampling
using Distributions, Plots
using Test
@testset "end_to_end" begin
triangDist = TriangularDist(0,2,1)
xGrid = 0:0.1:2
N = 10^6
inverseSampledData = quantile.(triangDist,rand(N))

histogram( inverseSampledData, bins = 30, normed = true,
    ylims = (0,1.1), label = "Inverse transform data")
plot!( xGrid, pdf.(triangDist,xGrid), c = :red, lw = 4,
    xlabel = "x", label = "PDF", ylabel = "Density", legend = :topright)
end