using Test
using StatisticsWithJulia.c01_intro: squares
using StatisticsWithJulia.c01_intro: tab_separated_string

@testset "Test squares function" begin
    result = squares(0:10)
    # Test if the result contains the expected square roots of perfect squares
    @test result == [0, 1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
end

@testset "Test tab_separated_string function" begin
    result = tab_separated_string(squares(0:10))
    # Test if the result contains the expected square roots of perfect squares
    @test result == "\t0\t1\t4\t9\t16\t25\t36\t49\t64\t81\t100"
end