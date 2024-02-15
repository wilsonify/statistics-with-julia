# Tests for Fast code example

using StatisticsWithJulia: comprehension_generate_data
using StatisticsWithJulia: calculate_quantiles
using Statistics
using Random
using Test
@testset "Test comprehension_generate_data function" begin
    result = comprehension_generate_data(100, 10)
    @test length(result) == 100
end

@testset "Test calculate_quantiles function" begin
    Random.seed!(0)
    data = comprehension_generate_data(100, 10)
    result = calculate_quantiles(data)
    result = round.(result, digits=2)
    expected_result = (0.26, 0.69)
    @test isapprox(result[1], expected_result[1], atol=0.05)
    @test isapprox(result[2], expected_result[2], atol=0.05)
end