using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")


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