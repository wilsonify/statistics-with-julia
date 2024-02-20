using Test
using c05_inference: generate_fValues
using c05_inference: plot_fValues

@testset "generate_fValues test" begin
N = 1000
mu, sigma = 10, 4
normDist = Normal(mu,sigma)
fValues = generate_fValues(N,mu,sigma)
@test length(fValues) == N
end

@testset "end-to-end" begin

N = 10^6
mu, sigma = 10, 4
normDist = Normal(mu,sigma)
fValues = generate_fValues(N,mu,sigma)
plot_fValues(fValues)
end
