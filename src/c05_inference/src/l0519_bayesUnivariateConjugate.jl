#=
Bayesian estimation of a Poisson distribution
using gamma conjugacy
The prior and posterior are both gamma distributed
=#
using LaTeXStrings, Distributions, Plots; gr()

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

using LaTeXStrings
using Distributions # mean(Gamma)
using Plots; gr()

function main_l0519_bayesUnivariateConjugate()

    # set the data values.
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]

    # define the prior hyper-parameters
    alpha, beta = 8, 2
    # define the prior distribution
    prior(lam) = pdf(Gamma(alpha, 1 / beta), lam)


    # calculate the posterior by brute force
    like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
    posteriorUpToK(lam) = like(lam) * prior(lam)

    delta = 10^-4.
    lamRange = 0:delta:10
    K = sum([posteriorUpToK(lam) * delta for lam in lamRange])
    posterior(lam) = posteriorUpToK(lam) / K

    # compute the Bayes estimate by brute force
    bayesEstimate = sum([lam*posterior(lam) * delta for lam in lamRange])

    # update the hyper-parameters according to the conjugacy rule
    newAlpha, newBeta = alpha + sum(data), beta + length(data)

    # compute closedFormBayesEstimate using the formula for the mean of a gamma distribution
    # (using mean() from Distributions.jl).

    closedFormBayesEstimate = mean(Gamma(newAlpha, 1 / newBeta))

    println("Computational Bayes Estimate: ", bayesEstimate)
    println("Closed form Bayes Estimate: ", closedFormBayesEstimate)

    # create Figure
    y1=prior.(lamRange)
    y2=posterior.(lamRange)

    plot(
    lamRange,
    y1,
    c = :blue,
    label = "Prior distribution"
    )
    plot!(
    lamRange,
    y2,
    c = :red,
    label = "Posterior distribution",
    xlims = (0, 10),
    ylims = (0, 1.2),
    xlabel = L"\lambda",ylabel = "Density"
    )
end