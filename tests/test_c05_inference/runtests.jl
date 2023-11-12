using Test
using SafeTestsets

@time @safetestset "smoke Test" begin
    @test true
end

@time @safetestset "test_l0501_statisticsOfARandomSample.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0501_statisticsOfARandomSample.jl")
end
@time @safetestset "test_l0502_friendOfANormalDistribution.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0502_friendOfANormalDistribution.jl")
end
@time @safetestset "test_l0503_meanVarIndependence.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0503_meanVarIndependence.jl")
end
@time @safetestset "test_l0504_tDistribution.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0504_tDistribution.jl")
end
@time @safetestset "test_l0505_fDistribution.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0505_fDistribution.jl")
end
@time @safetestset "test_l0506_centralLimitTheorem.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0506_centralLimitTheorem.jl")
end
@time @safetestset "test_l0507_stdVarBiasEstimate.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0507_stdVarBiasEstimate.jl")
end
@time @safetestset "test_l0508_parametersNumerical.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0508_parametersNumerical.jl")
end
@time @safetestset "test_l0509_gammaLikelihood.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0509_gammaLikelihood.jl")
end
@time @safetestset "test_l0510_mleGamma.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0510_mleGamma.jl")
end
@time @safetestset "test_l0511_mm_vs_mle.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0511_mm_vs_mle.jl")
end
@time @safetestset "test_l0512_confidenceIntervalConcept.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0512_confidenceIntervalConcept.jl")
end
@time @safetestset "test_l0513_ciCoverage.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0513_ciCoverage.jl")
end
@time @safetestset "test_l0514_teststatPvalRejectregion.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0514_teststatPvalRejectregion.jl")
end
@time @safetestset "test_l0515_simpleHypothesisTest.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0515_simpleHypothesisTest.jl")
end
@time @safetestset "test_l0516_receiverOperatingCurve.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0516_receiverOperatingCurve.jl")
end
@time @safetestset "test_l0517_randomizationTest.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0517_randomizationTest.jl")
end
@time @safetestset "test_l0518_bayesUnivariate.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0518_bayesUnivariate.jl")
end
@time @safetestset "test_l0519_bayesUnivariateConjugate.jl  Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0519_bayesUnivariateConjugate.jl")
end
@time @safetestset "test_l0520_bayesMCMC.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0520_bayesMCMC.jl")
end