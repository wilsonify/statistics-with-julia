using Test



@time @testset "smoke Test" begin
    @test true
end

@time @testset "test_l0301_randomVariable.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0301_randomVariable.jl")
end
@time @testset "test_l0302_discreteContinuous.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0302_discreteContinuous.jl")
end
@time @testset "test_l0303_meanIntegration.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0303_meanIntegration.jl")
end
@time @testset "test_l0304_varianceTransformation.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0304_varianceTransformation.jl")
end
@time @testset "test_l0305_cdfFromPdf.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0305_cdfFromPdf.jl")
end
@time @testset "test_l0306_inverseCDF.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0306_inverseCDF.jl")
end
@time @testset "test_l0307_mgf.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0307_mgf.jl")
end
@time @testset "test_l0308_weightVector.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0308_weightVector.jl")
end
@time @testset "test_l0309_triangularDist.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0309_triangularDist.jl")
end
@time @testset "test_l0310_distributionDescriptors.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0310_distributionDescriptors.jl")
end
@time @testset "test_l0311_basicDistRand.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0311_basicDistRand.jl")
end
@time @testset "test_l0312_triangularDistInv.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0312_triangularDistInv.jl")
end
@time @testset "test_l0313_discreteDists.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0313_discreteDists.jl")
end
@time @testset "test_l0314_uniformDiscreteDice.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0314_uniformDiscreteDice.jl")
end
@time @testset "test_l0315_binomialCoinFlip.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0315_binomialCoinFlip.jl")
end
@time @testset "test_l0316_geometric.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0316_geometric.jl")
end
@time @testset "test_l0317_negativeBinomial.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0317_negativeBinomial.jl")
end
@time @testset "test_l0318_hypergeometric.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0318_hypergeometric.jl")
end
@time @testset "test_l0319_poisson.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0319_poisson.jl")
end
@time @testset "test_l0320_continuousDists.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0320_continuousDists.jl")
end
@time @testset "test_l0321_continuousUniform.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0321_continuousUniform.jl")
end
@time @testset "test_l0322_expGeom.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0322_expGeom.jl")
end
@time @testset "test_l0323_gammaDist.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0323_gammaDist.jl")
end
@time @testset "test_l0324_betaDist.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0324_betaDist.jl")
end
@time @testset "test_l0325_gammafunctionIntegration.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0325_gammafunctionIntegration.jl")
end
@time @testset "test_l0326_weibullHazard.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0326_weibullHazard.jl")
end
@time @testset "test_l0327_normalCalculus.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0327_normalCalculus.jl")
end
@time @testset "test_l0328_rayleigh.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0328_rayleigh.jl")
end
@time @testset "test_l0329_normalDistribution.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0329_normalDistribution.jl")
end
@time @testset "test_l0330_cauchyCMA.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0330_cauchyCMA.jl")
end
@time @testset "test_l0331_jointPDF.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0331_jointPDF.jl")
end
@time @testset "test_l0332_multiRVgeneration.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0332_multiRVgeneration.jl")
end
@time @testset "test_l0333_multiDimensionalIntegration.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0333_multiDimensionalIntegration.jl")
end
@time @testset "test_l0334_bivariateNormal.jl Tests" begin
    path_to_here = @__DIR__
    include("$path_to_here/test_l0334_bivariateNormal.jl")
end
