using LaTeXStrings, Distributions, Plots; pyplot()

data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
alpha, beta = 8, 2
sig = 0.5
lamRange = 0:0.01:10

prior(lam) = pdf(Gamma(alpha, 1 / beta), lam)
like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
posteriorUpToK(lam) = like(lam) * prior(lam)
foldedNormalPDF(x, mu) = (1 / sqrt(2 * pi*sig^2)) * (exp(-(x - mu)^2 / 2sig^2) + exp(-(x + mu)^2 / 2sig^2))
foldedNormalRV(mu) = abs(rand(Normal(mu,sig)))
closedFormPosterior(lam) = pdf(Gamma(alpha + sum(data),1 / (beta + length(data))),lam)

function sampler(piProb, qProp, rvProp)
    lam = 1
    warmN, N = 10^5, 10^6
    samples = zeros(N - warmN)

    for t in 1:N
        while true
            lamTry = rvProp(lam)
            L = piProb(lamTry) / piProb(lam)
            H = min(1,L*qProp(lam,lamTry) / qProp(lamTry,lam))
            if rand() < H
                lam = lamTry
                if t > warmN
                    samples[t - warmN] = lam
                end
                break
            end
        end
    end
    return samples
end


@testset "end_to_end" begin
    mcmcSamples = sampler(posteriorUpToK,foldedNormalPDF,foldedNormalRV)
    result = mean(mcmcSamples)
    result = round(result,digits = 2)
    @test result == 2.07
    stephist(mcmcSamples, bins = 100,    c = :black, normed = true, label = "Histogram of MCMC samples")
    plot!(lamRange, prior.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, closedFormPosterior.(lamRange),     c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end