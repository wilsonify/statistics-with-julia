using Statistics, StatsBase, LinearAlgebra, DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

df = CSV.read("$path_to_data/3featureData.csv",DataFrame,header = false)
n, p = size(df)
println("Number of features: ", p)
println("Number of observations: ", n)
X = convert(Array{Float64,2},Matrix(df))
println("Dimensions of data matrix: ", size(X))

xbarA = (1 / n) * X'*ones(n)
xbarB = [mean(X[:, i]) for i in 1:p]
xbarC = sum(X,dims = 1) / n
println("\nAlternative calculations of (sample) mean vector: ")
@show(xbarA), @show(xbarB), @show(xbarC)

Y = (I - ones(n,n) / n) * X
println("Y is the de-meaned data: ", mean(Y,dims = 1))

first_term = (X .- xbarA')'
second_term = (X .- xbarA')
numerator = first_term * second_term
denominator = (n - 1)
covA = numerator / denominator
covB = Y'*Y / (n - 1)
covC = [cov(X[:, i], X[:, j]) for i in 1:p, j in 1:p]
covD = [cor(X[:, i], X[:, j]) * std(X[:, i]) * std(X[:, j]) for i in 1:p, j in 1:p]
covE = cov(X)
println("\nAlternative calculations of (sample) covariance matrix: ")
@show(covA), @show(covB), @show(covC), @show(covD), @show(covE)

ZmatA = [(X[i, j] - mean(X[:, j])) / std(X[:, j]) for i in 1:n, j in 1:p ]
ZmatB = hcat([zscore(X[:, j]) for j in 1:p]...)
println("\nAlternate computation of Z-scores yields same matrix: ", maximum(norm(ZmatA - ZmatB)))
Z = ZmatA

corA = covA ./ [std(X[:, i]) * std(X[:, j]) for i in 1:p, j in 1:p]
corB = covA ./ (std(X,dims = 1)' * std(X,dims = 1))
corC = [cor(X[:,i],X[:,j]) for i in 1:p, j in 1:p]
corD = Z'*Z/(n-1)
corE = cov(Z)
corF = cor(X)
println("\nAlternative calculations of (sample) correlation matrix: ")
@show(corA), @show(corB), @show(corC), @show(corD), @show(corE), @show(corF);
