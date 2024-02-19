#=
Confidence Interval for single sample population with known variance
=#
using CSV
using Distributions
using HypothesisTests
using DataFrames

function summarize_n_xBar_z(data)
    alpha = 0.1
    n = length(data)
    xBar = mean(data)
    z = quantile(Normal(),1 - alpha / 2)
    return n,xBar,z
end

function confidence_interval_known_variance(data)
    sig = 1.2
    alpha = 0.1
    n,xBar,z = summarize_n_xBar_z(data)
    lower = xBar - z*sig / sqrt(n)
    upper = xBar + z*sig / sqrt(n)
    confidence_interval = (lower,upper )
    return confidence_interval
    end

function confidence_interval_known_variance_builtin(data)
    sig = 1.2
    alpha = 0.1
    n,xBar,z = summarize_n_xBar_z(data)
    ztest = OneSampleZTest(xBar,sig,n)
    ci = confint(ztest,level = 1 - alpha,tail = :both)
    return ci
end

function main_l0601_onePopVKnown()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # load the data.
    # Note the use of the header=false argument,
    # and also the trailing [:,1] which is used to select all rows of the data.
    data = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]

    # calculate the sample mean and the number of observations.
    xBar, n = mean(data), length(data)
    # set the standard deviation since variance is known.
    sig = 1.2
    # set the confidence level
    alpha = 0.1

    # calculate the value of z for 1 − α/2.
    # z does not depend on the sample heuristically approximately 1.65 when α = 10%.
    z = quantile(Normal(),1 - alpha / 2)
    # evaluate the conﬁdence interval.
    lower_calc = xBar - z*sig / sqrt(n)
    upper_calc = xBar + z*sig / sqrt(n)
    println("Calculating formula: ", (lower_calc, upper_calc))

    # the same using builtin function to conduct a one-sample z-test
    # the two methods should agree
    ztest = OneSampleZTest(xBar,sig,n)
    ci = confint(ztest, level = 1 - alpha, tail = :both)
    println("Using confint() function: ", ci)
end

export summarize_n_xBar_z
export confidence_interval_known_variance
export confidence_interval_known_variance_builtin