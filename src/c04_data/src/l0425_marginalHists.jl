# Heatmap and marginal histograms

using StatsPlots
using Distributions
using CSV
using DataFrames
using Measures
using io_library: read_temperatures

function main_l0425_marginalHists()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    # we create realData based on the Brisbane and Gold Coast temperature file.
    realData = read_temperatures("$path_to_data/temperatures.csv")

    # create the syntheticData data frame with N observations based on the bivariate normal distribution
    # biNorm using the parameters in mvParams.jl similarly to Listing 3.34.
    # The actual creation of the DataFrame object in line 8 creates default column names, x1 and x2.
    N = 10^5
    include("$path_to_data/mvParams.jl")
    biNorm = MvNormal(meanVect, covMat)

    default(c = cgrad([:blue, :red]),
        xlabel = "Brisbane Temperature",
        ylabel = "Gold Coast Temperature")

    # The remainder of the code creates the two heat maps with marginals plots using marginalhist() in lines 15–16.
    # Observe that, for the synthetic data, we are able to use a much larger number of bins.
    # Note the use of the cgrad() function in line 11,
    # setting the color gradient as part of the default parameters.
    p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins = 10:45)

    syntheticMatrix = rand(MvNormal(meanVect, covMat), N)

    p2 = marginalhist(syntheticMatrix[1, :], syntheticMatrix[2, :], bins = 10:.5:45)

    plot(p1, p2, size = (1000, 500), margin = 10mm)
    savefig("l0425_heatmap_with_marginal_histogram.png")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0425_marginalHists()
end