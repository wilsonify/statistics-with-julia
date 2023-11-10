using Combinatorics, Statistics, DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
data = CSV.read("$path_to_data/fertilizer.csv", DataFrame)
control = data.Control
fertilizer = data.FertilizerX

subGroups = collect(combinations([control; fertilizer],10))

meanFert = mean(fertilizer)
pVal = sum([mean(i) >= meanFert for i in subGroups]) / length(subGroups)
println("p-value = ", pVal)