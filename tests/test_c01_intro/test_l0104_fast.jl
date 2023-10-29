# Tests for Fast code example
using Statistics, Random

path_to_here = @__DIR__
path_to_module = abspath("$path_to_here/../../c01_intro")
include("$path_to_module/l0103_slow.jl")
include("$path_to_module/l0104_fast.jl")

@testset "Test comprehension_generate_data function" begin
    result = comprehension_generate_data(100,10)
    @test length(result) ==  100
end

@testset "Test summarize_data function" begin
    Random.seed!(0)
    data = comprehension_generate_data(100,10)
    result = summarize_data(data)
    result = round.(result, digits = 2)
    @test result == (0.31, 0.66)
end