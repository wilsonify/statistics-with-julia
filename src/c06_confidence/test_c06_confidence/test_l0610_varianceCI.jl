using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

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
@testset "sigma_squared" begin
data = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
sigma_squared = estimate_sigma_squared(data)
sigma_squared = round(sigma_squared,digits = 2)
@test sigma_squared == 1.39
end


@testset "compute_variance_confidence" begin
data = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
ci = compute_variance_confidence(data)
ci = round.(ci,digits = 2)
@test ci == (0.88, 2.62)
end

@testset "end_to_end" begin
data = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
sigma_squared = estimate_sigma_squared(data)
sigma_squared = round(sigma_squared,digits = 2)
@test sigma_squared == 1.39

ci = compute_variance_confidence(data)
ci = round.(ci,digits = 2)
@test ci == (0.88, 2.62)
end