using Test

using StatisticsWithJulia: comprehension_sqrt
using StatisticsWithJulia: comprehension_polynomial
using StatisticsWithJulia: broadcast_round

@testset "Test comprehension_sqrt function" begin
    result = comprehension_sqrt(0:10)
    result = broadcast_round(result)
    @test result == [0.0, 1.0, 1.41, 1.73, 2.0, 2.24, 2.45, 2.65, 2.83, 3.0, 3.16]
end

@testset "Test comprehension_polynomial function" begin
    result = comprehension_polynomial(0:10)
    result = broadcast_round(result)
    @test result == [1, 9, 25, 49, 81, 121, 169, 225, 289, 361, 441]
end