using Test

@time @testset "smoke Test" begin
    @test true
end

@time @testset "l0120_usingPython.jl Tests" begin
    include("$(@__DIR__)/test_l0120_usingPython.jl")
end
