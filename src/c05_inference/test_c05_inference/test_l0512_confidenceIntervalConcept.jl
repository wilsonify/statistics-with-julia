@testset "end_to_end" begin

mu = 5.57
observation = generate_data_triangle(mu)
Lower_bound = round(L(observation),digits = 2)
Upper_bound = round(U(observation),digits = 2)
@test Lower_bound == 5.2
@test Upper_bound == 6.75
end