# Tests for Fast code example
using Statistics

path_to_here = @__DIR__
path_to_module = abspath("$path_to_here/../../c01_intro")
include("$path_to_module/l0103_slow.jl")
include("$path_to_module/l0104_fast.jl")

@testset "Test comprehension_generate_data function" begin
    result = comprehension_generate_data(100,10)
    @test length(result) ==  100
end
