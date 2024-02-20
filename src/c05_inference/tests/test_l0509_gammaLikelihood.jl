using Test
using c05_inference: generate_Gamma
using c05_inference: likelihood_Gamma


@testset "generate_Gamma" begin
    actualAlpha, actualLambda = 2, 3
    result = generate_Gamma(actualAlpha, actualLambda,10^2)
    @test length(result) == 100
end

@testset "likelihood_Gamma" begin
    actualAlpha, actualLambda = 2,3
    alphaGrid = 1:0.02:3
    lambdaGrid = 2:0.02:5
    gammaDist = Gamma(actualAlpha,1 / actualLambda)
    sample = rand(gammaDist, 10^2)
    result = likelihood_Gamma(sample, lambdaGrid, alphaGrid)
    @test length(result) == 15251
end
