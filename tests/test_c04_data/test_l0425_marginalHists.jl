using StatsPlots, Distributions, CSV, DataFrames, Measures;
pyplot();
function main()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../data")

    realData = CSV.read("$path_to_data/temperatures.csv", DataFrame)

    N = 10^5
    include("$path_to_data/mvParams.jl")
    biNorm = MvNormal(meanVect, covMat)

    default(
        c = cgrad([:blue, :red]),
        xlabel = "Brisbane Temperature",
        ylabel = "Gold Coast Temperature",
    )

    p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins = 10:45)

    syntheticMatrix = rand(MvNormal(meanVect, covMat), N)

    p2 = marginalhist(syntheticMatrix[1, :], syntheticMatrix[2, :], bins = 10:0.5:45)

    plot(p1, p2, size = (1000, 500), margin = 10mm)
    savefig("l0425_heatmap_with_marginal_histogram.png")
end
