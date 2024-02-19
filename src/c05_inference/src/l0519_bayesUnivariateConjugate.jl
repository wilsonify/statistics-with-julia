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

# define the prior distribution
prior2_gamma(lam) = pdf(Gamma(alpha, 1 / beta), lam)
# calculate the posterior by brute force
like2_poisson(lam) = *([pdf(Poisson(lam),x) for x in data]...)
# Bayes’ rule applied to densities with constant evidence aka marginal likelihood
posteriorUpToK2(lam) = like2_poisson(lam) * prior2_gamma(lam)
compute_K() = sum([posteriorUpToK2(lam) * delta for lam in lamRange])
# define the actual posterior
posterior2(lam) = posteriorUpToK2(lam) / compute_K()
compute_bayesEstimate() = sum([lam*posterior2(lam) * delta for lam in lamRange])
compute_closedFormBayesEstimate() = mean(Gamma(newAlpha, 1 / newBeta))

using LaTeXStrings
using Distributions # mean(Gamma)
using Plots; gr()

function main_l0519_bayesUnivariateConjugate()

    # set the data values.
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]

    # define the prior hyper-parameters
    alpha, beta = 8, 2
    delta = 10^-4.
    lamRange = 0:delta:10



    # compute the Bayes estimate by brute force
    bayesEstimate = sum([lam*posterior2(lam) * delta for lam in lamRange])

    # update the hyper-parameters according to the conjugacy rule
    newAlpha, newBeta = alpha + sum(data), beta + length(data)

    # compute closedFormBayesEstimate using the formula for the mean of a gamma distribution
    # (using mean() from Distributions.jl).

    closedFormBayesEstimate = mean(Gamma(newAlpha, 1 / newBeta))

    println("Computational Bayes Estimate: ", bayesEstimate)
    println("Closed form Bayes Estimate: ", closedFormBayesEstimate)

    # create Figure
    y1= prior2_gamma.(lamRange)
    y2= posterior2.(lamRange)

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