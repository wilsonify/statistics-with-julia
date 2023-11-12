using Random, Distributions, Plots, LaTeXStrings;

actualAlpha, actualLambda = 2, 3
n = 10^2
alphaGrid = 1:0.02:3
lambdaGrid = 2:0.02:5

function generate_Gamma()
    
    gammaDist = Gamma(actualAlpha, 1 / actualLambda)
    sample = rand(gammaDist, n)
    return sample
end

function likelihood_Gamma()
    return [prod([pdf.(Gamma(a, 1 / l), v) for v in sample]) for l in lambdaGrid, a in alphaGrid]
end

@testset "end_to_end" begin
    result = generate_Gamma()
    @test length(result) == 100
end

@testset "end_to_end" begin
    Random.seed!(0)
    likelihood = likelihood_Gamma()
    surface(alphaGrid,
        lambdaGrid,
        likelihood,
        lw = 0.1,
        c = cgrad([:blue, :red]),
        legend = :none,
        camera = (135, 20),
        xlabel = L"\alpha",
        ylabel = L"\lambda",
        zlabel = "Likelihood")
end