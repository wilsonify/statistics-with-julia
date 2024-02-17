#=
Bayesian estimation of a Poisson distribution.
The prior triangular distribution in blue
the posterior in red
=#

using Distributions, LaTeXStrings, Plots; gr()
using Distributions, LaTeXStrings, Plots; gr()

data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
delta = 10^-2.
lamRange = 0:delta:10

prior(lam) = pdf(TriangularDist(0, 10, 3), lam)
like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
posteriorUpToK(lam) = like(lam) * prior(lam)
compute_K() = sum([posteriorUpToK(lam) * delta for lam in lamRange])
posterior(lam) = posteriorUpToK(lam) / compute_K()
compute_bayesEstimate() = sum([lam*posterior(lam) * delta for lam in lamRange])

@testset "prior" begin
 result = prior(2)
 result = round(result,digits = 2)
 @test result == 0.13
end
@testset "like" begin
result = like(10)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "posteriorUpToK" begin
result = posteriorUpToK(3)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_K" begin
result = compute_K()
  result = round(result,digits = 4)
  @test result == 0.0
end
@testset "posterior" begin
result = posterior(5)
 result = round(result,digits = 4)
 @test result == 0.0
end
@testset "compute_bayesEstimate" begin
result = compute_bayesEstimate()
  result = round(result,digits = 2)
  @test result == 1.94
end


using Test
@testset "end_to_end" begin
    bayesEstimate = compute_bayesEstimate()
    bayesEstimate = round(bayesEstimate,digits = 2)
    @test bayesEstimate == 1.94
    plot(lamRange, prior.(lamRange),     c = :blue, label = "Prior distribution")
    plot!(lamRange, posterior.(lamRange),    c = :red, label = "Posterior distribution",    xlims = (0, 10), ylims = (0, 1.2),    xlabel = L"\lambda",ylabel = "Density")
end
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