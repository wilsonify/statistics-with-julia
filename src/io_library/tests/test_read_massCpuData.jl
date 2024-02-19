
using Test
using DataFrames
using io_library: read_mass_cpus_from_csv

@testset "read_mass_cpus_from_csv test" begin
    data = read_mass_cpus_from_csv("$(@__DIR__)/../../../data/mass_cpus.csv")
    @test nrow(data) == 209
end