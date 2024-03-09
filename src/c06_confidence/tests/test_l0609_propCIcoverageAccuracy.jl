using Random
using Distributions
using Measures
using c06_confidence: compute_zscore
using c06_confidence: compute_errs
using Plots; gr()
using Test

@testset "compute_zscore" begin
    Random.seed!(0)
    N = 5 * 10^3
    alpha = 0.05
    confLevel = 1 - alpha
    z = compute_zscore(alpha)
    z = round(z,digits = 2)
    @test z == 1.96
end

@testset "end_to_end" begin
    N = 5 * 10^3
    alpha = 0.05
    confLevel = 1 - alpha
    z = compute_zscore(alpha)
    pGrid = 0.1:0.01:0.9
    nGrid = 5:1:50
    errs = compute_errs(pGrid,nGrid)
    default(xlabel = "p", ylabel = "n",
    xticks = ([1:5:length(pGrid); ], minimum(pGrid):0.05:maximum(pGrid)),
    yticks = ([1:5:length(nGrid); ], minimum(nGrid):5:maximum(nGrid)))
    p1 = heatmap(errs, c=cgrad([:white, :black]))
    p2 = heatmap(abs.(errs) .<= 0.04, legend = false, c=cgrad([:white, :black]))
    plot(p1,p2, size = (1000,400), margin = 5mm)
end