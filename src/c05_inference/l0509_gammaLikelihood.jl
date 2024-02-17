#=
Likelihood function for a gamma distribution.
=#
using Random, Distributions, LaTeXStrings, Plots; gr()

function generate_Gamma(a,l,n)
    gammaDist = Gamma(a, 1 / l)
    sample = rand(gammaDist, n)
    return sample
end

function likelihood_Gamma(sample, lambdaGrid, alphaGrid)
    return [prod([pdf.(Gamma(a, 1 / l), v) for v in sample]) for l in lambdaGrid, a in alphaGrid]
end


function main_l0509_gammaLikelihood()
    actualAlpha, actualLambda = 2, 3
    n = 10^2
    alphaGrid = 1:0.02:3
    lambdaGrid = 2:0.02:5

    # specify the parameters α and λ, as well as the underlying distribution, gammaDist.
    # Note that the gamma distribution in Julia, Gamma(), (i.e. Gamma() uses α, and 1/λ).
    actualAlpha, actualLambda = 2,3
    gammaDist = Gamma(actualAlpha,1 / actualLambda)

    # generate n observations
    n = 10^2
    sample = rand(gammaDist, n)

    # specify the grid of values to calculate the likelihood function
    alphaGrid = 1:0.02:3
    lambdaGrid = 2:0.02:5

    # evaluate a two-dimensional array of likelihoods on all PDF values, evaluated for each sample, v
    # the two-way comprehension repeats for all combinations of alphaGrid and lambdaGrid
    likelihood = [prod([pdf.(Gamma(a,1 / l),v) for v in sample]) for l in lambdaGrid, a in alphaGrid]

    # create the plot.

    surface(
        alphaGrid,
        lambdaGrid,
        likelihood,
        lw = 0.1,
        c = cgrad([:blue, :red]),
        legend = :none,
        camera = (135,20),
        xlabel = L"\alpha",
        ylabel = L"\lambda",
        zlabel = "Likelihood"
        )
end

using Test

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
