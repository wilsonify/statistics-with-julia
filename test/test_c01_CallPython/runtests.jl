using Test
using SafeTestsets


@time @safetestset "smoke Test" begin
    @test true
end

@time @safetestset "l0120_usingPython.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0120_usingPython.jl")
end


