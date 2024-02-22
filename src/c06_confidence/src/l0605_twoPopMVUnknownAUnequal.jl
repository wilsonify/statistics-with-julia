#=
Confidence Interval for a difference in means
with unknown and unequal variance
=#
using CSV
using Distributions
using HypothesisTests
using DataFrames
using io_library: read_machine_data

function confidence_interval_unknown_unequal_var_formula(data1, data2)
    alpha = 0.05
    xBar1, xBar2 = mean(data1), mean(data2)
    s1, s2 = std(data1), std(data2)
    n1, n2 = length(data1), length(data2)
    # calculate degrees of freedom
    v = (s1^2 / n1 + s2^2 / n2)^2 / ( (s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1) )
    # derive the T-statistic
    t = quantile(TDist(v),1 - alpha / 2)
    lower = xBar1 - xBar2 - t*sqrt(s1^2 / n1 + s2^2 / n2)
    upper = xBar1 - xBar2 + t*sqrt(s1^2 / n1 + s2^2 / n2)
    return (lower, upper)
end

function confidence_interval_unknown_unequal_var_builtin(data1, data2)
    alpha = 0.05
    unequal_variance_t_test = UnequalVarianceTTest(data1,data2)
    ci = confint(unequal_variance_t_test,level = 1 - alpha,tail = :both)
    return ci
end

function main_l0605_twoPopMVUnknownAUnequal()
    data1 = CSV.read("$(@__DIR__)/../../data/machine1.csv", DataFrame, header = false)[:,1]
    data2 = CSV.read("$(@__DIR__)/../../data/machine2.csv", DataFrame, header = false)[:,1]
    xBar1, xBar2 = mean(data1), mean(data2)
    s1, s2 = std(data1), std(data2)
    n1, n2 = length(data1), length(data2)
    alpha = 0.05

    # calculate degrees of freedom
    v = (s1^2 / n1 + s2^2 / n2)^2 / ( (s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1) )

    # derive the T-statistic
    t = quantile(TDist(v),1 - alpha / 2)

    # evaluate confidence interval
    lower = xBar1 - xBar2 - t*sqrt(s1^2 / n1 + s2^2 / n2)
    upper = xBar1 - xBar2 + t*sqrt(s1^2 / n1 + s2^2 / n2)
    println("Calculating formula: ", (lower,upper))

    # compare to the builtin confint()
    unequal_variance_t_test = UnequalVarianceTTest(data1,data2)
    ci = confint(unequal_variance_t_test,level = 1 - alpha,tail = :both)
    println("Using confint(): ",   )
end


