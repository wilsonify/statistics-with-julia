
using StatisticsWithJulia.c02_probability: matchExists1
using StatisticsWithJulia.c02_probability: matchExists2
using StatisticsWithJulia.c02_probability: probEst
using StatisticsWithJulia.c02_probability: bdEvent
using StatisticsWithJulia.c02_probability: calculate_max_error
using StatisticsWithJulia.c02_probability: run_simulation_birthday_problem
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

@testset "Test run_simulation_birthday_problem function" begin
    N = 100
    xGrid = 1:5
    result = run_simulation_birthday_problem(N, xGrid)
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


