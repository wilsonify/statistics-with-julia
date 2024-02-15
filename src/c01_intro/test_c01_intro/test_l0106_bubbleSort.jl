# Tests for Bubble sort
using StatisticsWithJulia: bubbleSort!
using Test

@testset "Test bubbleSort function" begin
    data = [65, 51, 32, 12, 23, 84, 68, 1]
    result = bubbleSort!(data)
    @test result == [1, 12, 23, 32, 51, 65, 68, 84]
end