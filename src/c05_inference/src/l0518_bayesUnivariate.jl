#=
Bayesian estimation of a Poisson distribution.
The prior triangular distribution in blue
the posterior in red
=#

using Distributions
using LaTeXStrings
using Plots; gr()


data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
delta = 10^-2.
lamRange = 0:delta:10

# define the prior.
prior1_triangle(lam) = pdf(TriangularDist(0, 10, 3), lam)
# define the likelihood function.
# Notice that the * operator is used as a function
# and that the splat operator ... is applied inside the brackets.
like1_poisson(lam) = *([pdf(Poisson(lam),x) for x in data]...)
# Bayes’ rule applied to densities with constant evidence aka marginal likelihood
posteriorUpToK1(lam) = like1_poisson(lam) * prior1_triangle(lam)
compute_K1() = sum([posteriorUpToK1(lam) * delta for lam in lamRange])
# define the actual posterior
posterior1(lam) = posteriorUpToK1(lam) / compute_K1()
# calculate a Bayesian estimate from the prior
compute_bayesEstimate1() = sum([lam*posterior1(lam) * delta for lam in lamRange])

function main_l0518_bayesUnivariate()

    # set the data values.
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
    # numerically compute the evidence.
    delta = 10^-4.
    lamRange = 0:delta:10
    K = sum([posteriorUpToK1(lam) * delta for lam in lamRange])
    bayesEstimate = sum([lam*posterior1(lam) * delta for lam in lamRange])
    println("Bayes estimate: ",bayesEstimate)

    # create Figure
    y1= prior1_triangle.(lamRange)
    y2= posterior1.(lamRange)

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