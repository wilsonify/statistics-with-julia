# Slow code example
using Statistics, Random, Test

path_to_here = @__DIR__
path_to_module = abspath("$path_to_here/../../c01_intro")
include("$path_to_module/l0103_slow.jl")


@testset "Test generate_random_data function" begin
    result = generate_random_data(100,10)
    @test length(result) ==  100
end
@testset "Test calculate_quantiles function" begin
    Random.seed!(0)
    data = generate_random_data(100,10)
    result = calculate_quantiles(data)
    result = round.(result, digits = 2)
    @test result == (0.26, 0.69)
end