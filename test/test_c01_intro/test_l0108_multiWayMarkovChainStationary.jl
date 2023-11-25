using StatisticsWithJulia: calculate_steady_state_matrix_exponentiation
using StatisticsWithJulia: calculate_steady_state_linear_system
using StatisticsWithJulia: calculate_steady_state_eigenvalues
using StatisticsWithJulia: calculate_steady_state_monte_carlo

using Test

# Define a test for the calculate_steady_state_matrix_exponentiation function
@testset "Test calculate_steady_state_matrix_exponentiation function" begin
    P = [0.5 0.4 0.1; 0.3 0.2 0.5; 0.5 0.3 0.2]
    n = 100
    result = calculate_steady_state_matrix_exponentiation(P, n)

    @test length(result) == 3
    @test isapprox(sum(result), 1.0, atol = 1e-6)
end

# Define a test for the calculate_steady_state_linear_system function
@testset "Test calculate_steady_state_linear_system function" begin
    P = [0.5 0.4 0.1; 0.3 0.2 0.5; 0.5 0.3 0.2]
    result = calculate_steady_state_linear_system(P)

    @test length(result) == 3
    @test isapprox(sum(result), 1.0, atol = 1e-6)
end

# Define a test for the calculate_steady_state_eigenvalues function
@testset "Test calculate_steady_state_eigenvalues function" begin
    P = [0.5 0.4 0.1; 0.3 0.2 0.5; 0.5 0.3 0.2]
    result = calculate_steady_state_eigenvalues(P)
    @test length(result) == 3
    @test isapprox(sum(result), 1.0, atol = 1e-6)
end

# Define a test for the calculate_steady_state_monte_carlo function
@testset "Test calculate_steady_state_monte_carlo function" begin
    P = [0.5 0.4 0.1; 0.3 0.2 0.5; 0.5 0.3 0.2]
    N = 10^6
    result = calculate_steady_state_monte_carlo(P, N)
    @test length(result) == 3
    @test isapprox(sum(result), 1.0, atol = 1e-3)  # Allow for some Monte Carlo error
end
