using Statistics
using StatsBase
using LinearAlgebra
using DataFrames
using CSV
using Test
using Random

using StatisticsWithJulia: df_to_array_3featureData
using StatisticsWithJulia: sample_mean_vector1
using StatisticsWithJulia: sample_mean_vector2
using StatisticsWithJulia: sample_mean_vector3
using StatisticsWithJulia: sample_covariance_matrix1
using StatisticsWithJulia: sample_covariance_matrix2
using StatisticsWithJulia: sample_covariance_matrix3
using StatisticsWithJulia: sample_covariance_matrix4
using StatisticsWithJulia: sample_covariance_matrix5
using StatisticsWithJulia: sample_correlation_matrix1
using StatisticsWithJulia: sample_correlation_matrix2
using StatisticsWithJulia: sample_correlation_matrix3
using StatisticsWithJulia: sample_correlation_matrix4
using StatisticsWithJulia: sample_correlation_matrix5
using StatisticsWithJulia: sample_correlation_matrix6

include("$(@__DIR__)/../../src/io_library/read_3featureData.jl")
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

@testset "read_3featureData" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    result = size(df)
    @test result == (7, 3)
end

@testset "df_to_array_3featureData" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    @test size(x) == (7, 3)
end
@testset "sample_mean_vector1" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_mean_vector1(x)
    result = round.(result, digits = 2)
    @test result == [1.06, 2.09, 3.5]
end

@testset "sample_mean_vector2" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_mean_vector2(x)
    result = round.(result, digits = 2)
    @test result == [1.06, 2.09, 3.5]
end

@testset "sample_mean_vector3" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_mean_vector3(x)
    result = round.(result, digits = 2)
    @test result == [1.06 2.09 3.5]
end

@testset "sample_covariance_matrix1" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix1(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 - 0.09 0.44; -0.09 0.12 - 0.71; 0.44 - 0.71 8.03]
    #@test result==expected_result
    @test is_all_approx_array(result,expected_result)
end

@testset "sample_covariance_matrix2" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix2(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 - 0.09 0.44; -0.09 0.12 - 0.72; 0.44 - 0.72 8.03]
    @test result == expected_result
end

@testset "sample_covariance_matrix3" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix3(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 - 0.09 0.44; -0.09 0.12 - 0.72; 0.44 - 0.72 8.03]
    @test result == expected_result
end

@testset "sample_covariance_matrix4" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix4(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 - 0.09 0.44; -0.09 0.12 - 0.72; 0.44 - 0.72 8.03]
    @test result == expected_result
end

@testset "sample_covariance_matrix5" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_covariance_matrix5(x)
    result = round.(result, digits = 2)
    expected_result = [0.12 - 0.09 0.44; -0.09 0.12 - 0.72; 0.44 - 0.72 8.03]
    for i in 1:size(result, 1), j in 1:size(result, 2)
        @test isapprox(result[i, j], expected_result[i, j], atol = 0.05)
    end
end

@testset "Z_scores1 test" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = Z_scores1(x)
    result = round.(result, digits = 2)
    expected_result = [-0.45 0.04 - 0.81;
        0.12 - 0.53 - 0.35;
        1.86 - 0.53 - 0.04;
        -0.74 0.61 - 0.42;
        0.7 - 1.39 2.08;
        -1.03 1.76 - 0.78;
        -0.45 0.04 0.32]
    println("result = $result")
    @test result == expected_result
end

@testset "Z_scores2 test" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = Z_scores2(x)
    expected_result = [-0.45 0.04 - 0.81;
        0.12 - 0.53 - 0.35;
        1.86 - 0.53 - 0.04;
        -0.74 0.61 - 0.42;
        0.7 - 1.39 2.08;
        -1.03 1.76 - 0.78;
        -0.45 0.04 0.32]
    result == expected_result
end

@testset "sample_correlation_matrix1" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix1(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix2" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix2(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix3" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix3(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix4" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix4(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix5" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix5(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end

@testset "sample_correlation_matrix6" begin
    Random.seed!(0)
    df = read_3featureData("$path_to_data/3featureData.csv")
    x = df_to_array_3featureData(df)
    result = sample_correlation_matrix6(x)
    result = round.(result, digits = 2)
    expected_result = [1.0 - 0.73 0.45; -0.73 1.0 - 0.72; 0.45 - 0.72 1.0]
    @test result == expected_result
end


