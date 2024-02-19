
using Test
using DataFrames
using io_library: read_machine_data

@testset "read_machine_data test" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    @test nrow(data) == 20
end