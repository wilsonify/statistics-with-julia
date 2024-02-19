
using Test
using DataFrames
using io_library: read_iris_from_csv

@testset "read_iris_data test" begin
    data = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
    @test nrow(data) == 150
end