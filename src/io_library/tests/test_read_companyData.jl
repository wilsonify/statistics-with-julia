
using Test
using DataFrames
using io_library: read_companyData

@testset "read_companyData test" begin
    data = read_companyData("$(@__DIR__)/../../../data/companyData.csv")
    @test nrow(data) == 15
end