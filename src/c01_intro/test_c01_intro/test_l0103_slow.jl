# Slow code example
using StatisticsWithJulia.c01_intro: generate_random_data_slowly
using StatisticsWithJulia.c01_intro: calculate_quantiles
using Statistics, Random, Test

@testset "Test generate_random_data_slowly function" begin
    result = generate_random_data_slowly(100, 10)
    @test length(result) == 100
end
using Test

@testset "Test calculate_quantiles function" begin
    Random.seed!(0)
    data = generate_random_data_slowly(100, 10)
    result = calculate_quantiles(data)
    expected_result = (0.26, 0.69)
    @test isapprox(result[1], expected_result[1], atol=0.05)
    @test isapprox(result[2], expected_result[2], atol=0.05)
end
