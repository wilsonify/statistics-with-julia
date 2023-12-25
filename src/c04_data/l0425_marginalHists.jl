# Heatmap and marginal histograms
#=
In line 3,
we create realData based on the Brisbane and Gold Coast temperature file.
Lines 5–9
create the syntheticData data frame with N observations based on the bivariate normal distribution
biNorm using the parameters in mvParams.jl similarly to Listing 3.34.
The actual creation of the DataFrame object in line 8 creates default column names, x1 and x2.
We then rename these in line 9.
The remainder of the code creates the two heat maps with marginals plots using marginalhist() in lines 15–16.
Observe that, for the synthetic data, we are able to use a much larger number of bins.
Note the use of the cgrad() function in line 11,
setting the color gradient as part of the default parameters.
=#
using StatsPlots, Distributions, CSV, DataFrames, Measures
function main_l0425_marginalHists()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    realData = CSV.read("$path_to_data/temperatures.csv", DataFrame)

    N = 10^5
    include("$path_to_data/mvParams.jl")
    biNorm = MvNormal(meanVect, covMat)

    default(c=cgrad([:blue, :red]),
        xlabel="Brisbane Temperature",
        ylabel="Gold Coast Temperature")

    p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins=10:45)

    syntheticMatrix = rand(MvNormal(meanVect, covMat), N)

    p2 = marginalhist(syntheticMatrix[1, :], syntheticMatrix[2, :], bins=10:.5:45)

    plot(p1, p2, size=(1000, 500), margin=10mm)
    savefig("l0425_heatmap_with_marginal_histogram.png")
end

using StatsPlots, Distributions, CSV, DataFrames, Measures
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
include("$path_to_data/mvParams.jl")

read_temperature_Data() = CSV.read("$path_to_data/temperatures.csv", DataFrame)

using Test
@testset "end_to_end" begin
    N = 10^5
    realData = read_temperature_Data()
    biNorm = MvNormal(meanVect, covMat)
    default(c = cgrad([:blue, :red]),        xlabel = "Brisbane Temperature",        ylabel = "Gold Coast Temperature")
    p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins = 10:45)
    syntheticMatrix = rand(MvNormal(meanVect, covMat), N)
    p2 = marginalhist(syntheticMatrix[1, :], syntheticMatrix[2, :], bins = 10:0.5:45)
    plot(p1, p2, size = (1000, 500), margin = 10mm)
    savefig("l0425_heatmap_with_marginal_histogram.png")
end
