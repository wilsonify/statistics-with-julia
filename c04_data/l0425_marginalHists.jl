using StatsPlots, Distributions, CSV, DataFrames, Measures; pyplot()
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../data")

realData = CSV.read("$path_to_data/temperatures.csv", DataFrame)

N = 10^5
include("../data/mvParams.jl")
biNorm = MvNormal(meanVect,covMat)
syntheticData = DataFrame(rand(MvNormal(meanVect,covMat),N)')
rename!(syntheticData,[:x1=>:Brisbane, :x2 => :GoldCoast])

default(c=cgrad([:blue, :red]), 
    xlabel="Brisbane Temperature", 
    ylabel="Gold Coast Temperature")

p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins=10:45)
p2 = marginalhist(syntheticData.Brisbane, syntheticData.GoldCoast, bins=10:.5:45)

plot(p1,p2, size = (1000,500), margin = 10mm)
