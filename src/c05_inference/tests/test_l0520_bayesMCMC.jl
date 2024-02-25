using Test
using LaTeXStrings
using Distributions
using Plots; gr()
using c05_inference: sampler1
using c05_inference: prior3_gamma
using c05_inference: like3_poisson
using c05_inference: posteriorUpToK3
using c05_inference: foldedNormalPDF
using c05_inference: foldedNormalRV
using c05_inference: closedFormPosterior

@testset "end_to_end" begin
    mcmcSamples = sampler1(posteriorUpToK3,foldedNormalPDF,foldedNormalRV)
    result = mean(mcmcSamples)
    result = round(result,digits = 2)
    @test isapprox(result,2.07,atol=0.5)
    lamRange = 0:0.01:10
    stephist(mcmcSamples, bins = 100,    c = :black, normed = true, label = "Histogram of MCMC samples")
    plot!(lamRange, prior3_gamma.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, closedFormPosterior.(lamRange),     c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end