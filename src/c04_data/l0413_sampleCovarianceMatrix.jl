# Sample covariance

using Statistics
using StatsBase
using LinearAlgebra
using DataFrames
using CSV
include("$(@__DIR__)/../io_library/read_3featureData.jl")

function df_to_array_3featureData(data)
    return convert(Array{Float64, 2}, Matrix(data))
end

function sample_mean_vector1(X)
    # we use the size() function to set the number of observations, n, and number of features p.
    # The convert() function is used in line 6 to extract a data matrix out of the data frame df.
    n, p = size(X)
    return (1 / n) * X' * ones(n)
end
function sample_mean_vector2(X)
    n, p = size(X)
    return [mean(X[:, i]) for i in 1:p]
end

function sample_mean_vector3(X)
    # dims=1 indicates to sum over columns.
    n, p = size(X)
    return sum(X, dims = 1) / n
end

function de_mean(X)
    n, p = size(X)
    return (I - ones(n, n) / n) * X
end

function sample_covariance_matrix1(X)
    n, p = size(X)
    xbarA = sample_mean_vector1(X)
    first_term = (X .- xbarA')'
    second_term = (X .- xbarA')
    numerator = first_term * second_term
    denominator = (n - 1)
    cov = numerator / denominator
    return cov
end
function sample_covariance_matrix2(X)
    n, p = size(X)
    Y = de_mean(X)
    cov = Y' * Y / (n - 1)
    return cov
end

function sample_covariance_matrix3(X)
    n, p = size(X)
    return [cov(X[:, i], X[:, j]) for i in 1:p, j in 1:p]
end

function sample_covariance_matrix4(X)
    n, p = size(X)
    return [cor(X[:, i], X[:, j]) * std(X[:, i]) * std(X[:, j]) for i in 1:p, j in 1:p]
end

function sample_covariance_matrix5(X)
    return cov(X)
end

function Z_scores1(X)
    n, p = size(X)
    return [(X[i, j] - mean(X[:, j])) / std(X[:, j]) for i in 1:n, j in 1:p]
end

function Z_scores2(X)
    n, p = size(X)
    return hcat([zscore(X[:, j]) for j in 1:p]...)
end

function sample_correlation_matrix1(X)
    n, p = size(X)
    covA = sample_covariance_matrix1(X)
    return covA ./ [std(X[:, i]) * std(X[:, j]) for i in 1:p, j in 1:p]
end

function sample_correlation_matrix2(X)
    covA = sample_covariance_matrix1(X)
    return covA./(std(X, dims = 1)' * std(X, dims = 1))
end
function sample_correlation_matrix3(X)
    n, p = size(X)
    return [cor(X[:, i], X[:, j]) for i in 1:p, j in 1:p]
end

function sample_correlation_matrix4(X)
    n, p = size(X)
    ZmatA = Z_scores1(X)
    return ZmatA' * ZmatA / (n - 1)
end

function sample_correlation_matrix5(X)
    ZmatA = Z_scores1(X)
    return cov(ZmatA)
end

function sample_correlation_matrix6(X)
    return cor(X)
end

function main_sample_covariance_matrix()
    df_3feature = read_3featureData()

    # we use the size() function to set the number of observations, n, and number of features p.
    # The convert() function is used in line 6 to extract a data matrix out of the data frame df.
    n, p = size(df_3feature)
    println("Number of features: ", p)
    println("Number of observations: ", n)

    x = df_to_array_3featureData(df_3feature)
    println("Dimensions of data matrix: ", size(x))
    # show alternative ways of computing the sample mean vector.
    # Note the use of dims=1 in the sum() function
    xbarA = sample_mean_vector1(x)
    xbarB = sample_mean_vector2(x)
    xbarC = sample_mean_vector3(x)
    println("\nAlternative calculations of (sample) mean vector: ")
    @show(xbarA)
    @show(xbarB)
    @show(xbarC)

    # we create the de-meaned data Y
    y = de_mean(x)
    # show that the mean is 0 (effectively 0 in the output).
    println("Y is the de-meaned data: ", mean(y, dims = 1))

    # illustrate a variety of ways to calculate the sample covariance matrix using several forms of (4.5).
    covA = sample_covariance_matrix1(x)
    covB = sample_covariance_matrix2(x)
    covC = sample_covariance_matrix3(x)
    covD = sample_covariance_matrix4(x)
    covE = sample_covariance_matrix5(x)

    println("\nAlternative calculations of (sample) covariance matrix: ")
    @show(covA)
    @show(covB)
    @show(covC)
    @show(covD)
    @show(covE)

    # deal with standardized data as in (4.3).
    # The printout of the maximum of the norm in line 29 is
    # a way for seeing that the two matrices ZmatA and ZmatB are identical.

    ZmatA = Z_scores1(x)
    ZmatB = Z_scores2(x)
    println("\nAlternate computation of Z-scores yields same matrix: ")
    println(maximum(norm(ZmatA - ZmatB)))

    # compute the correlation matrix in a variety of ways.
    # the covariance of Z is the correlation of X
    corA = sample_correlation_matrix1(x)
    corB = sample_correlation_matrix2(x)
    corC = sample_correlation_matrix3(x)
    corD = sample_correlation_matrix4(x)
    corE = sample_correlation_matrix5(x)
    corF = sample_correlation_matrix6(x)
    println("\nAlternative calculations of (sample) correlation matrix: ")
    @show(corA)
    @show(corB)
    @show(corC)
    @show(corD)
    @show(corE)
    @show(corF)
end


function main_l0413_sampleCovarianceMatrix()
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


    corA = covA ./[std(X[:, i]) * std(X[:, j]) for i in 1:p, j in 1:p]
    corB = covA ./(std(X,dims = 1)' * std(X,dims = 1))
    corC = [cor(X[:,i],X[:,j]) for i in 1:p, j in 1:p]
    corD = ZmatA'*ZmatA/(n-1)
    corE = cov(Z)
    corF = cor(X)
    println("\nAlternative calculations of (sample) correlation matrix: ")
    @show(corA), @show(corB), @show(corC), @show(corD), @show(corE), @show(corF);
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0413_sampleCovarianceMatrix()
end

export df_to_array_3featureData
export sample_mean_vector1
export sample_mean_vector2
export sample_mean_vector3
export sample_covariance_matrix1
export sample_covariance_matrix2
export sample_covariance_matrix3
export sample_covariance_matrix4
export sample_covariance_matrix5
export sample_correlation_matrix1
export sample_correlation_matrix2
export sample_correlation_matrix3
export sample_correlation_matrix4
export sample_correlation_matrix5
export sample_correlation_matrix6

