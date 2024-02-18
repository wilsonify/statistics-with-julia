
@testset "end_to_end" begin
    mcmcSamples = sampler(posteriorUpToK,foldedNormalPDF,foldedNormalRV)
    result = mean(mcmcSamples)
    result = round(result,digits = 2)
    @test result == 2.07
    stephist(mcmcSamples, bins = 100,    c = :black, normed = true, label = "Histogram of MCMC samples")
    plot!(lamRange, prior.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, closedFormPosterior.(lamRange),     c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end