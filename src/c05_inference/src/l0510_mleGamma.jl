#=
Repetitions of MLE for a gamma(2, 3) distribution with
n = 10, 100, 1000. For n = 100 and n = 1000,
for a larger number of observations, is is asymptotically normal.
the data is centered on the true underlying parameters alpha and lambda
therefore, the MLE is asymptotically unbiased.
=#
using SpecialFunctions # digamma()
using Roots # find_zero()
using Distributions
using LaTeXStrings
using Plots; gr()

using SpecialFunctions, Distributions, Roots, LaTeXStrings, Plots; gr()

function eq(alpha, xb, xbl)
    # eq takes three arguments, alpha, a sample mean (xb), observation (xbl)
    return log(alpha) - digamma(alpha) - log(xb) + xbl
end

function sample_Gamma(n, alpha, lambda)
    shape = alpha
    scale = 1 / lambda
    gammaDist = Gamma(shape, scale)
    sample = rand(gammaDist, n)
    return sample
    end

function mle(sample)
    # takes an array of sample observations,
    # solves the value of alpha which satisfies the zero of eq().
    # apply eq() on vectors.
    # use find_zero() with initial value = 1
    # the mean of the log of each observation xbl is calculated element-wise 'log.()'
    alpha = find_zero( (a)->eq(a,mean(sample),mean(log.(sample))), 1)
    # calculate the corresponding lambda value
    lambda = alpha / mean(sample)
    # return an array of both alpha and lambda
    return [alpha, lambda]
end


function compute_mles(N, sample)
     result = [mle(sample) for _ in 1:N]
     return result
end


function main_l0510_mleGamma()
    # specify the parameters of the underlying gamma distribution,
    actualAlpha, actualLambda = 2, 3
    gammaDist = Gamma(actualAlpha,1 / actualLambda)

    N = 10^4
    # random samples are made from our gamma distribution,
    # solve for the corresponding values of alpha and lambda
    # repeat N times; mles10 is an array of arrays.

    # Lines 17–18 repeat the same procedure as that in line 16, however in these two cases,
    # the experiments are conducted for 100 and 1000 random samples, respectively.
    mles10 = [mle(rand(gammaDist,10)) for _ in 1:N]
    mles100 = [mle(rand(gammaDist,100)) for _ in 1:N]
    mles1000 = [mle(rand(gammaDist,1000)) for _ in 1:N]
    # In lines 20–22, a scatterplot of the resulting pairs of α̂ and λ̂ are plotted,
    # for the cases of the sample size being equal to 10, 100, and 1000.
    #
    # Note the use of the first() and last() functions,
    # which are used to return the values of alpha and lambda respectively.
    #
    # Note that the bivariate distribution of alpha and lambda can be observed.

    mles10_first = first.(mles10)
    mles10_last = last.(mles10)
    mles100_first = first.(mles100)
    mles100_last = last.(mles100)
    mles1000_first = first.(mles1000)
    mles1000_last = last.(mles1000)

    scatter(
        mles10_first,
        mles10_last,
        c = :blue,
        ms = 1,
        msw = 0,
        label = "n = 10"
    )
    scatter!(
        mles100_first,
        mles100_last,
        c = :red,
        ms = 1,
        msw = 0,
        label = "n = 100"
    )
    scatter!(
        mles1000_first,
        mles1000_last,
        c = :green,
        ms = 1,
        msw = 0,
        label = "n = 1000",
        xlims = (0,6),
        ylims = (0,8),
        xlabel = L"\alpha",
        ylabel = L"\lambda"
    )
end