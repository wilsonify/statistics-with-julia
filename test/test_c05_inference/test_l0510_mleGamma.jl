using SpecialFunctions, Distributions, Roots, Plots, LaTeXStrings

function sample_Gamma(n, alpha, lambda)
    shape = alpha
    scale = 1 / lambda
    gammaDist = Gamma(shape, scale)
    sample = rand(gammaDist, n)
    return sample
    end

function mle(sample)
    eq(alpha, xb, xbl) = log(alpha) - digamma(alpha) - log(xb) + xbl
    alpha = find_zero((a) -> eq(a, mean(sample), mean(log.(sample))), 1)
    lambda = alpha / mean(sample)
    return [alpha, lambda]
end

function compute_mles(N, sample)
     result = [mle(sample) for _ in 1:N]
     return result
end

using Test,Random
@testset "sample_Gamma" begin
    Random.seed!(0)
    actualAlpha, actualLambda = 2, 3
    sample = sample_Gamma(5,actualAlpha, actualLambda)
    sample = round.(sample,digits = 2)
    @test sample == [0.82, 0.9, 0.37, 0.77, 0.63]
end
@testset "mle" begin
    Random.seed!(0)
    N = 10^4
    actualAlpha, actualLambda = 2, 3
    gammaDist = Gamma(actualAlpha, 1 / actualLambda)
    sample = rand(gammaDist, 10)
    result = mle(sample)
    result = round.(result,digits = 2)
    @test result == [5.3, 7.86]
end

@testset "end_to_end" begin
    Random.seed!(0)
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