#=
Ridge regression with k-fold cross validation
=#
using RDatasets, DataFrames, Random, LinearAlgebra, MultivariateStats
Random.seed!(0)

df = dataset("MASS", "cpus")
n = size(df)[1]
df = df[shuffle(1:n),:]

K = 10
nG = Int(floor(n/K))
n = K*nG
println("Losing $(size(df)[1] - n) observations.")

lamMin, lamMax = 0.0, 1.0
lamVals = collect(lamMin:(lamMax-lamMin)/(K-1):lamMax)

testSet(k) = collect(1+nG*(k-1):nG*k)
trainSet(k) = setdiff(1:n, testSet(k))

yTest(k) = convert(Array{Float64, 1}, df[testSet(k), :Perf])
yTrain(k) = convert(Array{Float64, 1}, df[trainSet(k), :Perf])

# Modify xTrain and xTest to extract the values from DataFrame columns as arrays
xTest(k) = [values(df[testSet(k), :Cach]) values(df[testSet(k), :ChMin])]
xTrain(k) = [values(df[trainSet(k), :Cach]) values(df[trainSet(k), :ChMin])]

betas = [ridge(xTrain(k), yTrain(k), lamVals[k]) for k in 1:K]
errs = [norm([ones(nG) xTest(k)] * betas[k] - yTest(k)) for k in 1:K]
bestLambda = lamVals[findmin(errs)[2]]

macro RR(x)
    return:(round.($x, digits=2))
end

println("Tried lambdas: ", @RR lamVals)
println("Errors: ", @RR errs)
println("Found the best lambda for regularization: ", bestLambda)

betaFinal = ridge([values(df[:, :MMin]) values(df[:, :Cach]) values(df[:, :ChMin])],
                   convert(Array{Float64, 1}, df[:, :Perf]), bestLambda)

println("Beta estimate: ", betaFinal)
