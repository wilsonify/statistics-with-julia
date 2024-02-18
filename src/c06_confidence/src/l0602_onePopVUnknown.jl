using DataFrames, CSV, Distributions, HypothesisTests
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
xBar, n = mean(data), length(data)
s = std(data)
alpha = 0.1
t = quantile(TDist(n-1),1-alpha/2)

println("Calculating formula: ", (xBar - t*s/sqrt(n), xBar + t*s/sqrt(n)))
println("Using confint() function: ", confint(OneSampleTTest(xBar,s,n),level=1-alpha,tail = :both))