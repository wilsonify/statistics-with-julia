using Statistics, StatsBase, LinearAlgebra, DataFrames, CSV
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_3featureData() = CSV.read("$path_to_data/3featureData.csv", DataFrame, header = false)

function df_to_array_3featureData(data)
    return convert(Array{Float64,2}, Matrix(data))
end

function sample_mean_vector1(X)
    n, p = size(X)
    return (1 / n) * X' * ones(n)
end
function sample_mean_vector2(X)
    n, p = size(X)
    return [mean(X[:, i]) for i = 1:p]
end

function sample_mean_vector3(X)
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
    return [cov(X[:, i], X[:, j]) for i = 1:p, j = 1:p]
end

function sample_covariance_matrix4(X)
    n, p = size(X)
    return [cor(X[:, i], X[:, j]) * std(X[:, i]) * std(X[:, j]) for i = 1:p, j = 1:p]
end


function sample_covariance_matrix5(X)
    return cov(X)
end


function Z_scores1(X)
    n, p = size(X)
    return [(X[i, j] - mean(X[:, j])) / std(X[:, j]) for i in 1:n, j in 1:p ]
end

function Z_scores2(X)
    n, p = size(X)
    return hcat([zscore(X[:, j]) for j = 1:p]...)
end

function sample_correlation_matrix1(X)
    n, p = size(X)
    covA = sample_covariance_matrix1(X)
    return covA ./[std(X[:, i]) * std(X[:, j]) for i = 1:p, j = 1:p]
end

function sample_correlation_matrix2(X)
    covA = sample_covariance_matrix1(X)
    return covA ./(std(X, dims=1)' * std(X, dims=1))
end
function sample_correlation_matrix3(X)
    n, p = size(X)
    return [cor(X[:, i], X[:, j]) for i = 1:p, j = 1:p]
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

function main()
    df_3feature = read_3featureData()
    n, p = size(df_3feature)
    println("Number of features: ", p)
    println("Number of observations: ", n)

    x = df_to_array_3featureData(df_3feature)
    println("Dimensions of data matrix: ", size(x))

    xbarA = sample_mean_vector1(x)
    xbarB = sample_mean_vector2(x)
    xbarC = sample_mean_vector3(x)
    println("\nAlternative calculations of (sample) mean vector: ")
    @show(xbarA)
    @show(xbarB)
    @show(xbarC)

    y = de_mean(x)
    println("Y is the de-meaned data: ", mean(y, dims = 1))

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

    ZmatA = Z_scores1(x)
    ZmatB = Z_scores2(x)
    println("\nAlternate computation of Z-scores yields same matrix: ")
    println(maximum(norm(ZmatA - ZmatB)))

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


using Test, Random

@testset "read_3featureData" begin
    Random.seed!(0)
    df = read_3featureData()
    result = size(df)
    @test result == (7, 3)
end

@testset "df_to_array_3featureData" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    @test size(x) == (7, 3)
end
@testset "sample_mean_vector1" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_mean_vector1(x)
    result = round.(result, digits = 2)
    @test result == [1.06, 2.09, 3.5]
end

@testset "sample_mean_vector2" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_mean_vector2(x)
    result = round.(result, digits = 2)
    @test result == [1.06, 2.09, 3.5]
end

@testset "sample_mean_vector3" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_mean_vector3(x)
    result = round.(result, digits = 2)
    @test result == [1.06 2.09 3.5]
end


@testset "sample_covariance_matrix1" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix1(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 -0.09 0.44; -0.09 0.12 -0.71; 0.44 -0.71 8.03]
    @test result == expected_result

end

@testset "sample_covariance_matrix2" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix2(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 -0.09 0.44; -0.09 0.12 -0.72; 0.44 -0.72 8.03]
    @test result==expected_result
end

@testset "sample_covariance_matrix3" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix3(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 -0.09 0.44; -0.09 0.12 -0.72; 0.44 -0.72 8.03]
    @test result==expected_result
end

@testset "sample_covariance_matrix4" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix4(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 -0.09 0.44; -0.09 0.12 -0.72; 0.44 -0.72 8.03]
    @test result==expected_result
end

@testset "sample_covariance_matrix5" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix5(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 -0.09 0.44; -0.09 0.12 -0.72; 0.44 -0.72 8.03]
    for i in 1:size(result, 1), j in 1:size(result, 2)
        @test isapprox(result[i, j], expected_result[i, j], atol = 0.05)
    end
end

@testset "Z_scores1 test" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = Z_scores1(x)
    result = round.(result, digits = 2)
    expected_result = [-0.45 0.04 -0.81; 0.12 -0.53 -0.35; 1.86 -0.53 -0.04; -0.74 0.61 -0.42; 0.7 -1.39 2.08; -1.03 1.76 -0.78; -0.45 0.04 0.32]
    println("result = $result")
    @test result == expected_result
end

@testset "Z_scores2 test" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = Z_scores2(x)
    expected_result = [-0.45 0.04 -0.81; 0.12 -0.53 -0.35; 1.86 -0.53 -0.04; -0.74 0.61 -0.42; 0.7 -1.39 2.08; -1.03 1.76 -0.78; -0.45 0.04 0.32]
    result == expected_result
end

@testset "sample_correlation_matrix1" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix1(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix2" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix2(x)
    result = round.(result, digits = 2)
    expected_result =  [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix3" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix3(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix4" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix4(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix5" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix5(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix6" begin
    Random.seed!(0)
    df = read_3featureData()
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix6(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 -0.73 0.45; -0.73 1.0 -0.72; 0.45 -0.72 1.0]
    @test result == expected_result
end



@testset "end-to-end" begin
    main()
end


