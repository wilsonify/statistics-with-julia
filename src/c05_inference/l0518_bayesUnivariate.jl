#=
Bayesian estimation of a Poisson distribution.
The prior triangular distribution in blue
the posterior in red
=#

using Distributions, LaTeXStrings, Plots; gr()

function main_l0518_bayesUnivariate()

    # set the data values.
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]

    # define the prior.
    prior(lam) = pdf(TriangularDist(0, 10, 3), lam)

    # define the likelihood function.
    # Notice that the * operator is used as a function
    # and that the splat operator ... is applied inside the brackets.
    like(lam) = *([pdf(Poisson(lam),x) for x in data]...)

    # Bayes’ rule applied to densities with constant evidence aka marginal likelihood
    posteriorUpToK(lam) = like(lam) * prior(lam)

    # numerically compute the evidence.
    delta = 10^-4.
    lamRange = 0:delta:10
    K = sum([posteriorUpToK(lam) * delta for lam in lamRange])

    # define the actual posterior
    posterior(lam) = posteriorUpToK(lam) / K

    # calculate a Bayesian estimate from the prior
    bayesEstimate = sum([lam*posterior(lam) * delta for lam in lamRange])
    println("Bayes estimate: ",bayesEstimate)

    # create Figure
    y1=prior.(lamRange)
    y2=posterior.(lamRange)

    plot(
    lamRange,
    y1,
    c = :blue, label = "Prior distribution"
    )
    plot!(
    lamRange,
    y2,
    c = :red,
    label = "Posterior distribution",
    xlims = (0, 10), ylims = (0, 1.2),
    xlabel = L"\lambda",ylabel = "Density"
    )
end