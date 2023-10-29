using Test

A = Set(['a', 'e', 'i', 'o', 'u'])
B = Set(['x', 'y', 'z'])
omega = 'a':'z'

N = 10^6

@testset "Monte Carlo Estimations" begin
    for _ in 1:5
        mcEst1 = sum([in(sample(omega), A) || in(sample(omega), B) for _ in 1:N]) / N
        mcEst2 = sum([in(sample(omega), union(A, B)) for _ in 1:N]) / N

        @test abs(mcEst1 - 0.16) < 0.02  # Check if mcEst1 is close to the expected value
        @test abs(mcEst2 - 0.16) < 0.02  # Check if mcEst2 is close to the expected value
    end
end
