#=
Bayesian inference using MCMC
The prior and the posterior for Monte Carlo Markov Chain
samples generated using Metropolis-Hastings.
it agrees with the gamma conjugate estimate
=#

using LaTeXStrings, Distributions, Plots; gr()
using LaTeXStrings, Distributions, Plots; gr()

data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]
alpha, beta = 8, 2
sig = 0.5
lamRange = 0:0.01:10

# define the prior.
prior3_gamma(lam) = pdf(Gamma(alpha, 1 / beta), lam)
# calculate the posterior by brute force
like3_poisson(lam) = *([pdf(Poisson(lam),x) for x in data]...)
# Bayes’ rule applied to densities with constant evidence aka marginal likelihood
posteriorUpToK3(lam) = like3_poisson(lam) * prior3_gamma(lam)
# define the folded normal distribution as a proposal density.
# the folded normal arrises from the absolute value of a normally distributed variable
foldedNormalPDF(x, mu) = (1 / sqrt(2 * pi*sig^2)) * (exp(-(x - mu)^2 / 2sig^2) + exp(-(x + mu)^2 / 2sig^2))
# define a function for generating a proposal
foldedNormalRV(mu) = abs(rand(Normal(mu,sig)))
# compute closedFormBayesEstimate using the formula for the mean of a gamma distribution
closedFormPosterior(lam) = pdf(Gamma(alpha + sum(data),1 / (beta + length(data))),lam)


# define the sampler function.
function sampler(piProb, qProp, rvProp)
    # All three arguments are functions which sampler() invokes.
    # piProb is a desired (non-normalized) density,
    # and runs the Metropolis-Hastings algorithm for sampling from that density.
    # qProp is the proposal density,
    # rvProp is for generating from the proposal.
    lam = 1
    # specify warm up length
    # The idea is to let the algorithm run for a while
    # in order to remove bias introduced by initial values.
    warmN, N = 10^5, 10^6
    samples = zeros(N - warmN)
    # Lines 20–33 constitute the main loop over N samples generated by the algorithm.
    # In our implementation,
    # we set up an internal loop (lines 21–32) that iterates until a proposal is accepted (and breaks in line 30).
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

function main_l0518_bayesUnivariate()
    data = [2, 1, 0, 0, 1, 0, 2, 2, 5, 2, 4, 0, 3, 2, 5, 0]

    # define the prior hyper-parameters
    alpha, beta = 8, 2

    sig = 0.5

    mcmcSamples = sampler(posteriorUpToK3,foldedNormalPDF,foldedNormalRV)
    println("MCMC Bayes Estimate: ",mean(mcmcSamples))
    lamRange = 0:0.01:10
    y1= prior3_gamma.(lamRange)
    y2=closedFormPosterior.(lamRange)

    stephist(
    mcmcSamples,
     bins = 100,
     c = :black,
     normed = true,
     label = "Histogram of MCMC samples"
     )


    plot!(
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
    xlims = (0, 10), ylims = (0, 1.2),
    xlabel = L"\lambda",ylabel = "Density"
    )
end