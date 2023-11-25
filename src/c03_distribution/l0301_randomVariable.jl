# A simple random variable
using StatsBase, Plots

function main_l0301_randomVariable()
names = ["Mary", "Mel", "David", "John", "Kayley", "Anderson"]
randomName() = rand(names)
X = 3:8
N = 10^6
sampleLengths = [length(randomName()) for _ in 1:N]
bar(X,counts(sampleLengths) / N, ylims = (0,0.35), xlabel = "Name length", ylabel = "Estimated p(x)", legend = :none)
savefig("l0301_random_variable_bar.png")
end