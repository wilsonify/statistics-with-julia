
using Test
using DataFrames
using io_library: read_3featureData

@testset "read_iris_data test" begin
    data = read_3featureData("$(@__DIR__)/../../../data/3featureData.csv")
    @test nrow(data) == 7
end