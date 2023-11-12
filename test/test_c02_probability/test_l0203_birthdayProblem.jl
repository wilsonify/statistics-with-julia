using StatsBase, Combinatorics, Random, Plots ; pyplot()


function probEst(n, N)
    # Function to estimate the probability of a birthday match
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

function matchExists2(n)
    # Alternative Function to calculate the analytical solution for the birthday problem
     return 1 - factorial(365,365 - big(n)) / 365^big(n)
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
    xGrid = 1:50
    analyticSolution1 = [matchExists1(n) for n in xGrid]
    analyticSolution2 = [matchExists2(n) for n in xGrid]
    println("Maximum error: $(maximum(abs.(analyticSolution1 - analyticSolution2)))")
    N = 10^3
    mcEstimates = [probEst(n,N) for n in xGrid]
    plot(xGrid, analyticSolution1, c = :blue, label = "Analytic solution")
    scatter!(xGrid, mcEstimates, c = :red, ms = 6, msw = 0, shape = :xcross,
    label = "MC estimate", xlims = (0,50), ylims = (0, 1),
    xlabel = "Number of people in room",
    ylabel = "Probability of birthday match",
    legend = :topleft)
end

using Test
@testset "Test matchExists1 function" begin
    xGrid = 1:5
    result = [matchExists1(n) for n in xGrid]
    result = round.(result,digits = 2)
    @test result == [0.0, 0.0, 0.01, 0.02, 0.03]
end

@testset "Test matchExists2 function" begin
    xGrid = 1:5
    result = [matchExists2(n) for n in xGrid]
    @test length(result) == 5
end

@testset "Test probEst function" begin
    N = 10
    xGrid = 1:5
    result = [probEst(n,N) for n in xGrid]
    result = round.(result,digits = 2)
    @test length(result) == 5
end

@testset "Test bdEvent function" begin
    result = bdEvent(10)
    @test length(result) == 1
end

@testset "Test calculate_max_error function" begin
    xGrid = 1:5
    result = calculate_max_error(xGrid)
    @test length(result) == 1
end

@testset "Test run_simulation function" begin
    N = 100
    xGrid = 1:5
    result = run_simulation(N, xGrid)
    @test length(result) == 3
end


@testset "Test probEst function" begin
    N = 10^2  # Number of simulation iterations
    xGrid = 1:400  # Number of people in the room
    # Ensure the probability is in [0, 1] range
    for n in xGrid
        probability = probEst(n, N)
        @test 0 <= probability <= 1
    end
end

@testset "Test main function" begin
    main()
end
