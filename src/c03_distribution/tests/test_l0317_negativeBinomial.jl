# The negative binomial distribution
using c03_distribution: rouletteSpins
using StatsBase, Distributions, Plots
using Test
@testset "end_to_end" begin
    r, p, N = 5, 18 / 37,10^6
    xGrid = r:r + 15
    mcEstimate = counts([rouletteSpins(r,p) for _ in 1:N],xGrid) / N
    nbDist = NegativeBinomial(r,p)
    nbPmf = [pdf(nbDist,x - r) for x in xGrid]
    plot( xGrid, mcEstimate,     line = :stem, marker = :circle, c = :blue,    ms = 10, msw = 0, lw = 4, label = "MC estimate")
    plot!( xGrid, nbPmf, line = :stem,     marker = :xcross, c = :red, ms = 6, msw = 0, lw = 2, label = "PMF",     xlims = (0,maximum(xGrid)), ylims = (0,0.2),     xlabel = "x", ylabel = "Probability")
end