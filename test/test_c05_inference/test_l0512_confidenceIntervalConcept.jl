using Random, Distributions
alpha = 0.05

L(obs) = obs - (1 - sqrt(alpha))
U(obs) = obs + (1 - sqrt(alpha))

function generate_data_triangle(mu)
    sample = rand(TriangularDist(mu - 1,mu + 1,mu))
    return sample
end

@testset "end_to_end" begin
Random.seed!(0)
mu = 5.57
observation = generate_data_triangle(mu)
Lower_bound = round(L(observation),digits = 2)
Upper_bound = round(U(observation),digits = 2)
@test Lower_bound == 5.2
@test Upper_bound == 6.75
end