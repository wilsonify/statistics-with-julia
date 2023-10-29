

function even_sum_probability()
    N, faces = 10^6, 1:6

    numSol = sum([iseven(i + j) for i in faces, j in faces]) / length(faces)^2
    mcEst = sum([iseven(rand(faces) + rand(faces)) for i in 1:N]) / N

    return numSol, mcEst
end

using Test
# Define a test for even_sum_probability
@testset "Test even_sum_probability function" begin
    numSol, mcEst = even_sum_probability()

    @test numSol ≈ 0.5 atol=1e-3  # Expected value for numerical solution
    @test mcEst ≈ 0.5 atol=1e-3  # Expected value for Monte Carlo estimate
end
