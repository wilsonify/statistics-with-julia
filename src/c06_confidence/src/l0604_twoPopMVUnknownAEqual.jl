#=
Confidence Interval for a difference in means
with unknown yet equal variance
=#

using CSV
using Distributions
using HypothesisTests
using DataFrames

function confidence_interval_unknown_equal_var_formula(data1, data2)
    alpha = 0.05
    xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    t = quantile(TDist(n1 + n2 - 2),1 - alpha / 2)
    s1, s2 = std(data1), std(data2)
    sP = sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
    lower = xBar1 - xBar2 - t*sP* sqrt(1 / n1 + 1 / n2)
    upper = xBar1 - xBar2 + t*sP* sqrt(1 / n1 + 1 / n2)
    return (lower,upper)
end

function confidence_interval_unknown_equal_var_builtin(data1, data2)
	alpha = 0.05
    return confint(EqualVarianceTTest(data1,data2),level = 1 - alpha,tail = :both)
end

function main_l0604_twoPopMVUnknownAEqual()
    data1 = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
    data2 = CSV.read("$path_to_data/machine2.csv", DataFrame, header = false)[:,1]
    xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    alpha = 0.05

    # use a T-distribution with n1+n2-2 degrees of freedom
    t = quantile(TDist(n1 + n2 - 2),1 - alpha / 2)

    # calculate the sample standard deviation
    s1, s2 = std(data1), std(data2)

    # calculate the pooled sample variance sP
    sP = sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))

    # evaluate to confidence interval
    lower = xBar1 - xBar2 - t*sP* sqrt(1 / n1 + 1 / n2)
    upper = xBar1 - xBar2 + t*sP* sqrt(1 / n1 + 1 / n2)

    println("Calculating formula: ", (lower, upper))

    # it should match the builtin confint() function
    equal_variance_t_test = EqualVarianceTTest(data1,data2)
    ci = confint(equal_variance_t_test, level = 1 - alpha, tail = :both)

    println("Using confint(): ", ci)
end