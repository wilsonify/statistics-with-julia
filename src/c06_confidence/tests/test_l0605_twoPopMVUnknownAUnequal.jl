using Test
using c06_confidence: confidence_interval_unknown_unequal_var_formula
using c06_confidence: confidence_interval_unknown_unequal_var_builtin

@testset "read_machine" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")[:,1]
    @test length(data) == 20
end

@testset "confidence_interval_unknown_unequal_var_formula" begin
    data1 = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")[:,1]
    data2 = read_machine_data("$(@__DIR__)/../../../data/machine2.csv")[:,1]
    result = confidence_interval_unknown_unequal_var_formula(data1,data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end

@testset "confidence_interval_unknown_unequal_var_builtin" begin
    data1 = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")[:,1]
    data2 = read_machine_data("$(@__DIR__)/../../../data/machine2.csv")[:,1]
    result = confidence_interval_unknown_unequal_var_builtin(data1, data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end

@testset "matching" begin
    data1 = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")[:,1]
    data2 = read_machine_data("$(@__DIR__)/../../../data/machine2.csv")[:,1]
    cif = confidence_interval_unknown_unequal_var_formula(data1,data2)
    cif = round.(cif,digits = 2)
    cib = confidence_interval_unknown_unequal_var_builtin(data1,data2)
    cib = round.(cib,digits = 2)
    @test cib == cif
end