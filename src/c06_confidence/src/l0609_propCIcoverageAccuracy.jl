#=
Coverage accuracy of a confidence interval for proportions
=#

using Random
using Distributions
using Measures
using Plots; gr()

# checks if p is covered by the given confidence interval
cover(p, ci) = ci[1] <= p && p <= ci[2]

function randCI(n, p)
    # generating a random sample and an associated confidence interval.
    sample = rand(n) .< p
    pHat = sum(sample) / n
    serr = sqrt(pHat * (1 - pHat) / n)
    (pHat - z*serr, pHat + z*serr)
end

function compute_zscore(alpha)
    significance = 1 - alpha / 2
    z = quantile(Normal(),significance)
    return z
    end

function compute_errs(pGrid, nGrid)
    errs = zeros(length(nGrid),length(pGrid))
        for i in 1:length(nGrid)
            for j in 1:length(pGrid)
                Random.seed!(0)
                n, p = nGrid[i], pGrid[j]
                coverageRatio = sum([cover(p,randCI(n,p)) for _ in 1:N]) / N
                errs[i, j] = confLevel - coverageRatio
            end
        end
    return errs
end


function main_l0609_propCIcoverageAccuracy()
    # set the number of Monte Carlo repetitions, N.
    N = 5 * 10^3
    # define the confidence level
    alpha = 0.05
    confLevel = 1 - alpha
    z = quantile(Normal(),1 - alpha / 2)
    # define the grid of p values and n values on which we estimate
    pGrid = 0.1:0.01:0.9
    nGrid = 5:1:50
    # initialize the matrix errs using zeros().
    errs = zeros(length(nGrid),length(pGrid))
    for i in 1:length(nGrid)
        for j in 1:length(pGrid)
            # The simulation repetitions
            # for each (n, p) combination
            # compute the sum by composing cover() on randCI().
            n, p = nGrid[i], pGrid[j]
            coverageRatio = sum([cover(p,randCI(n,p)) for _ in 1:N]) / N
            # record the estimated difference in the matrix errs.
            errs[i, j] = confLevel - coverageRatio
        end
    end

    # create Figure
    heat1 = abs.(errs) .<= 0.04
    xticks = ([1:5:length(pGrid); ], minimum(pGrid):0.05:maximum(pGrid))
    yticks = ([1:5:length(nGrid); ], minimum(nGrid):5:maximum(nGrid))
    default(
        xlabel = "p",
        ylabel = "n",
        xticks = xticks,
        yticks = yticks
        )

    p1 = heatmap(
        errs,
        c = cgrad([:white, :black])
    )

    p2 = heatmap(
        heat1,
         legend = false,
         c = cgrad([:white, :black])
    )
    plot(p1, p2, size = (1000,400), margin = 5mm)
end