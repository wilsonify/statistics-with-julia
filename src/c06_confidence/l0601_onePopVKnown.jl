using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
xBar, n = mean(data), length(data)
sig = 1.2
alpha = 0.1
z = quantile(Normal(),1 - alpha / 2)

println("Calculating formula: ", (xBar - z*sig / sqrt(n), xBar + z*sig / sqrt(n)))
println("Using confint() function: ", confint(OneSampleZTest(xBar,sig,n),level = 1 - alpha,tail = :both))
