using Test
using LaTeXStrings
using c05_inference: sample_Gamma
using c05_inference: mle
using c05_inference: compute_mles

@testset "sample_Gamma" begin
    actualAlpha, actualLambda = 2, 3
    sample = sample_Gamma(5,actualAlpha, actualLambda)
    sample = round.(sample,digits = 2)
    @test length(sample) == 5
end

@testset "mle" begin
    N = 10^4
    actualAlpha, actualLambda = 2, 3
    gammaDist = Gamma(actualAlpha, 1 / actualLambda)
    sample = rand(gammaDist, 10)
    result = mle(sample)
    result = round.(result,digits = 2)
    @test length(result) == 2
end

@testset "compute_mles" begin
    N = 10^4
    actualAlpha, actualLambda = 2, 3
    samp10 = sample_Gamma(10, actualAlpha, actualLambda)
    mles10 = compute_mles(N, samp10)

    samp100 = sample_Gamma(100, actualAlpha, actualLambda)
    mles100 = compute_mles(N,samp100)

    samp1000 = sample_Gamma(1000, actualAlpha, actualLambda)
    mles1000 = compute_mles(N,samp1000)

    scatter(first.(mles10), last.(mles10), c = :blue, ms = 1, msw = 0, label = "n = 10")
    scatter!(first.(mles100), last.(mles100), c = :red, ms = 1, msw = 0, label = "n = 100")
    scatter!(first.(mles1000), last.(mles1000), c = :green, ms = 1, msw = 0, label = "n = 1000", xlims = (0, 6), ylims = (0, 8), xlabel = L"\alpha", ylabel = L"\lambda")
end
