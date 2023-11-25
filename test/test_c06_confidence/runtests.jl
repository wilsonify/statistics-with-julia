using Test


@time @testset "smoke Test" begin
    @test true
    end

@time @testset "test_l0601_onePopVKnown.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0601_onePopVKnown.jl")
 end
@time @testset "test_l0602_onePopVUnknown.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0602_onePopVUnknown.jl")
 end
@time @testset "test_l0603_twoPopVKnown.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0603_twoPopVKnown.jl")
 end
@time @testset "test_l0604_twoPopMVUnknownAEqual.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0604_twoPopMVUnknownAEqual.jl")
 end
@time @testset "test_l0605_twoPopMVUnknownAUnequal.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0605_twoPopMVUnknownAUnequal.jl")
 end
@time @testset "test_l0606_vDOF_comparison.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0606_vDOF_comparison.jl")
 end
@time @testset "test_l0607_proportionCI.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0607_proportionCI.jl")
 end
@time @testset "test_l0608_proportionCIsampleSize.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0608_proportionCIsampleSize.jl")
 end
@time @testset "test_l0609_propCIcoverageAccuracy.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0609_propCIcoverageAccuracy.jl")
 end
@time @testset "test_l0610_varianceCI.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0610_varianceCI.jl")
 end
@time @testset "test_l0611_sampleVarDists.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0611_sampleVarDists.jl")
 end
@time @testset "test_l0612_varianceCIalphas.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0612_varianceCIalphas.jl")
 end
@time @testset "test_l0613_bCI.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0613_bCI.jl")
 end
@time @testset "test_l0614_bootstrapCI.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0614_bootstrapCI.jl")
 end
@time @testset "test_l0615_predictionInterval.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0615_predictionInterval.jl")
 end
@time @testset "test_l0616_credible.jl" begin
 path_to_here = @__DIR__
 include("$path_to_here/test_l0616_credible.jl")
 end