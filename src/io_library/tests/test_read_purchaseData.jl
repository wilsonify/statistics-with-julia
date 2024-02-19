
using Test
using DataFrames
using io_library: read_purchaseData
using io_library: read_purchaseData_mutable
using io_library: read_purchaseData_immutable

@testset "read_purchaseData test" begin
    data = read_purchaseData("$(@__DIR__)/../../../data/purchaseData.csv")
    @test nrow(data) == 200
end

@testset "read_purchaseData_mutable test" begin
    data = read_purchaseData_mutable("$(@__DIR__)/../../../data/purchaseData.csv")
    @test nrow(data) == 200
end

@testset "read_purchaseData_immutable test" begin
    data = read_purchaseData_immutable("$(@__DIR__)/../../../data/purchaseData.csv")
    @test nrow(data) == 200
end