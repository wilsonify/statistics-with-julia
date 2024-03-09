#=
Confidence interval for the variance
=#
using CSV, Distributions, HypothesisTests, DataFrames

function estimate_sigma_squared(data)
n, s, alpha = length(data), std(data), 0.1
sigma_squared = s^2
return sigma_squared
end

function compute_variance_confidence(data)
    n, s, alpha = length(data), std(data), 0.1
    lower = (n - 1) * s^2 / quantile(Chisq(n - 1),1 - alpha / 2)
    upper = (n - 1) * s^2 / quantile(Chisq(n - 1),alpha / 2)
    return (lower, upper)

end

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
n, s, alpha = length(data), std(data), 0.1
ci = (  (n-1)*s^2/quantile(Chisq(n-1),1-alpha/2),
        (n-1)*s^2/quantile(Chisq(n-1),alpha/2)  )

println("Point estimate for the variance: ", s^2)
println("Confidence interval for the variance: ", ci)