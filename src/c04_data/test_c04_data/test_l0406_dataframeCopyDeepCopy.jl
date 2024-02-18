using DataFrames
using CSV
using Test
using StatisticsWithJulia.c04_data: create_a_reference
using StatisticsWithJulia.c04_data: create_a_shallow_copy1
using StatisticsWithJulia.c04_data: create_a_shallow_copy2
using StatisticsWithJulia.c04_data: create_a_deep_copy
using StatisticsWithJulia.c04_data: read_purchaseData

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")


@testset "create_a_reference test" begin
    data1 = read_purchaseData("$path_to_data/purchaseData.csv")
    @test data1.Name[1] == "MARYANNA"
    data1 = create_a_reference(data1)
    @test data1.Name[1] == "EMILY"
end
@testset "create_a_shallow_copy1 named access test" begin
    data1 = read_purchaseData("$path_to_data/purchaseData.csv")
    data1 = create_a_shallow_copy1(data1)
    @test data1.Name[1] == "MARYANNA"
end
@testset "create_a_shallow_copy2 shallow copy test" begin
    data1 = DataFrame()
    data1.X = [[0, 1], [100, 101]]
    data1 = create_a_shallow_copy2(data1)
    @test data1.X[1][1] == -1
end
@testset "create_a_deep_copy test" begin
    data1 = DataFrame(X = [[0, 1], [100, 101]])
    data1 = create_a_deep_copy(data1)
    @test data1.X[1][1] == 0
end
