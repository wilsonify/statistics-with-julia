using Test
using DataFrames
using c06_confidence: confidence_interval_unknown_var_formula
using c06_confidence: confidence_interval_unknown_var_builtin
using io_library: read_machine_data

@testset "read_machine" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data = data[:,1]
    @test length(data) == 20
end

@testset "confidence_interval_unknown_var_formula" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data = data[:,1]
    result = confidence_interval_unknown_var_formula(data)
    result = round.(result,digits = 2)
    @test result == (52.5, 53.41)
end

@testset "confidence_interval_unknown_var_builtin" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data = data[:,1]
    result = confidence_interval_unknown_var_builtin(data)
    result = round.(result,digits = 2)
    @test result == (52.5, 53.41)
end

@testset "confidence_interval_unknown_var_builtin" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data = data[:,1]
    cif = confidence_interval_unknown_var_formula(data)
    cif = round.(cif,digits = 2)
    cib = confidence_interval_unknown_var_builtin(data)
    cib = round.(cib,digits = 2)
    @test cib == cif
end
