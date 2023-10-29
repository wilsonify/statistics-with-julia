using StatsBase, Combinatorics, Random, Test


function probEst(n, N)
    # Function to estimate the probability of a birthday match
    # Simulate N experiments
    match_count = sum([bdEvent(n) for _ in 1:N])
    return match_count / N
end


function bdEvent(n)
    # Function to check if a birthday match exists
    birthdays = rand(1:365, n)
    dayCounts = counts(birthdays, 1:365)
    return maximum(dayCounts) > 1
end


function matchExists1(n)
    # Function to calculate the analytical solution for the birthday problem
    return 1 - prod([k / 365 for k in 365:-1:365 - n + 1])
end


function calculate_max_error(xGrid)
    # Function to calculate the maximum error between analytical solutions
    analyticSolution1 = [matchExists1(n) for n in xGrid]
    analyticSolution2 = [matchExists2(n) for n in xGrid]
    return maximum(abs.(analyticSolution1 - analyticSolution2))
end


function run_simulation(N, xGrid)
    # Function to run the Monte Carlo simulation and compare with analytical solution
    mcEstimates = [probEst(n, N) for n in xGrid]
    max_error = calculate_max_error(xGrid)
    return xGrid, mcEstimates, max_error
end

function main()
    # Main function to run the tests and get results
    test_probEst()
    xGrid, mcEstimates, max_error = run_simulation(10^5, 1:50)
    println("Maximum error: $max_error")
end



@testset "Test probEst function" begin
result = probEst()
@test length(result) == 8 end

@testset "Test bdEvent function" begin
result = bdEvent()
@test length(result) == 8 end

@testset "Test matchExists1 function" begin
result = matchExists1()
@test length(result) == 8 end

@testset "Test calculate_max_error function" begin
result = calculate_max_error()
@test length(result) == 8 end

@testset "Test run_simulation function" begin
result = run_simulation()
@test length(result) == 8 end

@testset "Test main function" begin
result = main()
@test length(result) == 8 end

@testset "Test probEst function" begin
    N = 10^5  # Number of simulation iterations
    xGrid = 1:50  # Number of people in the room

    # Ensure the probability is in [0, 1] range
    for n in xGrid
        probability = probEst(n, N)
        @test 0 <= probability <= 1
    end
end