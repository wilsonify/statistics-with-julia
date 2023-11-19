using DataFrames, GLM, PyPlot, Distributions, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

using Test
@testset "end_to_end" begin
data = CSV.read("$path_to_data/weightHeight.csv")
sData = sort(data, :Weight)[1:20,:]

model = lm(@formula(Height ~ Weight), sData)
pred(x) = coef(model)'*[1, x]

plot(sData.Weight, sData.Height,"b.")

xlims = [minimum(sData.Weight), maximum(sData.Weight)]
plot(xlims,pred.(xlims),"r")

tStat = coef(model)[2]/stderror(model)[2]
n = size(sData)[1]
pVal = 2*ccdf(TDist(n-2),tStat)
println("Manual Pval: ", pVal)
println(model)
end