
using Test
using DataFrames
using io_library: read_xclara_from_csv

@testset "read_xclara_from_csv test" begin
    data = read_xclara_from_csv("$(@__DIR__)/../../../data/xclara.csv")
    @test nrow(data) == 3000
end