using LaTeXStrings, Distributions, Plots

data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
alpha, beta = 8, 2
delta = 10^-2.
lamRange = 0:delta:10
newAlpha, newBeta = alpha + sum(data), beta + length(data)

prior(lam) = pdf(Gamma(alpha, 1 / beta), lam)
like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
posteriorUpToK(lam) = like(lam) * prior(lam)
compute_K() = sum([posteriorUpToK(lam) * delta for lam in lamRange])
posterior(lam) = posteriorUpToK(lam) / compute_K()
compute_bayesEstimate() = sum([lam*posterior(lam) * delta for lam in lamRange])
compute_closedFormBayesEstimate() = mean(Gamma(newAlpha, 1 / newBeta))

using Test
@testset "end_to_end" begin
bayesEstimate = compute_bayesEstimate()
bayesEstimate = round(bayesEstimate,digits = 2)
@test bayesEstimate == 2.06

closedFormBayesEstimate = compute_closedFormBayesEstimate()
closedFormBayesEstimate = round(closedFormBayesEstimate,digits = 2)
@test closedFormBayesEstimate == 2.06

plot(lamRange, prior.(lamRange),    c = :blue, label = "Prior distribution")
plot!(lamRange, posterior.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),        xlabel = L"\lambda",ylabel = "Density")
end