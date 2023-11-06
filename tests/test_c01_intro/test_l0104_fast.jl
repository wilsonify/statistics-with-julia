# Tests for Fast code example
using Statistics, Random

path_to_here = @__DIR__
path_to_module = abspath("$path_to_here/../../c01_intro")
include("$path_to_module/l0103_slow.jl")
include("$path_to_module/l0104_fast.jl")

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