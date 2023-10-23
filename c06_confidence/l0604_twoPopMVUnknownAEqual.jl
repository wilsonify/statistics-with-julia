using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../data")

data1 = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
data2 = CSV.read("$path_to_data/machine2.csv", DataFrame, header=false)[:,1]
xBar1, xBar2 = mean(data1), mean(data2)
n1, n2 = length(data1), length(data2)
alpha = 0.05
t = quantile(TDist(n1+n2-2),1-alpha/2)

s1, s2 = std(data1), std(data2)
sP = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2))

println("Calculating formula: ", (xBar1 - xBar2 - t*sP* sqrt(1/n1 + 1/n2),
				  xBar1 - xBar2 + t*sP* sqrt(1/n1 + 1/n2)))
println("Using confint(): ", confint(EqualVarianceTTest(data1,data2),alpha))
