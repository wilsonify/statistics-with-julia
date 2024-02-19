# The Poisson distribution
using c03_distribution: prn
using StatsBase, Distributions, Plots
using Test

@testset "prn" begin
    xGrid, lambda, N = 0:16, 5.5, 10^6
    pDist = Poisson(lambda)
    data = [prn(lambda) for _ in 1:N]
end

@testset "end_to_end" begin
    xGrid, lambda, N = 0:16, 5.5, 10^6
    pDist = Poisson(lambda)
    bPmf = pdf.(pDist,xGrid)
    data = counts([prn(lambda) for _ in 1:N],xGrid) / N
    plot( xGrid, data,     line = :stem, marker = :circle,    c = :blue, ms = 10, msw = 0, lw = 4, label = "MC estimate")
    plot!( xGrid, bPmf, line = :stem,    marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "PMF",    ylims = (0,0.2), xlabel = "x", ylabel = "Probability of x events")
end