using Test


@time @testset "smoke Test" begin
    @test true
end

@time @testset "l0121_usingC.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0121_usingC.jl")
end
