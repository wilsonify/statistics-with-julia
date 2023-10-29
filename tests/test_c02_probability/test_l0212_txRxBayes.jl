using Random

function flip_with_prob(bit, prob)
    return rand() < prob ? xor(bit,1) : bit
end

function bayes_rule(prob1, eps0, eps1)
    return ((1 - eps1) * prob1) / ((1 - eps1) * prob1 + (1 - prob1) * eps0)
end

using Test

@testset "Bayes Rule Tests" begin
    result = simulate_and_calculate(10^5, 0.7, 0.1, 0.05)
    expected_result = bayes_rule(0.7, 0.1, 0.05)
    @test isapprox(result, expected_result, atol = 1e-4)
end
