# The geometric distribution
using StatsBase, Distributions, Plots; gr()

function rouletteSpins(p)
    x = 0
    while true
        x += 1
        if rand() < p
            return x
        end
    end
end

function main_l0316_geometric()
    p, xGrid, N = 18 / 37, 1:7, 10^6

    mcEstimate = counts([rouletteSpins(p) for _ in 1:N],xGrid) / N

    gDist = Geometric(p)
    gPmf = [pdf(gDist,x - 1) for x in xGrid]

    plot(xGrid, mcEstimate, line = :stem, marker = :circle,
        c = :blue, ms = 10, msw = 0, lw = 4, label = "MC estimate")
    plot!( xGrid, gPmf, line = :stem, marker = :xcross,
        c = :red, ms = 6, msw = 0, lw = 2, label = "PMF",
        ylims = (0,0.5), xlabel = "x", ylabel = "Probability")

end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0316_geometric()
end