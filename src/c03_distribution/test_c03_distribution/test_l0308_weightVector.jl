# Sampling from a weight vector
using StatisticsWithJulia.c03_distribution: count_occurance
using StatsBase, Random
using Test

@testset "end_to_end" begin
    Random.seed!(1)
    N = 10^6
    grade = ["A", "B", "C", "D", "E"]
    weightVect = Weights([0.1, 0.2, 0.1, 0.2, 0.4])
    data = sample(grade,weightVect,N)
    result = count_occurance(data)
    @test length(result) == 5
end