#=
Confidence Interval for single sample population with unknown variance
This is very similar to known variance however, there are several differences.
=#
using DataFrames
using CSV
using Distributions
using HypothesisTests

function confidence_interval_unknown_var_formula(data)
    alpha = 0.1
    xBar, n = mean(data), length(data)
    s = std(data)
    t = quantile(TDist(n - 1),1 - alpha / 2)
    lower = xBar - t*s / sqrt(n)
    upper = xBar + t*s / sqrt(n)
    return (lower, upper)
    end

function confidence_interval_unknown_var_builtin(data)
    alpha = 0.1
    xBar, n = mean(data), length(data)
    s = std(data)
    t = quantile(TDist(n - 1),1 - alpha / 2)
    return confint(OneSampleTTest(xBar,s,n), level = 1 - alpha, tail = :both)
end

function main_l0602_onePopVUnknown()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
    xBar, n = mean(data), length(data)
    # since the population variance is unknown, use standard deviation
    s = std(data)
    # set the confidence level
    alpha = 0.1
    # calculate the quantile, t, on a T-distribution with n − 1 degrees of freedom.
    t = quantile(TDist(n-1),1-alpha/2)
    lower_calc=xBar - t*s/sqrt(n)
    upper_calc=xBar + t*s/sqrt(n)
    # the confidence interval is wider than that calculated with known variance
    println("Calculating formula: ", (lower_calc,upper_calc ))
    ttest = OneSampleTTest(xBar,s,n)
    ci=confint(ttest, level=1-alpha, tail = :both)
    println("Using confint() function: ", ci)
end

export confidence_interval_unknown_var_formula
export confidence_interval_unknown_var_builtin