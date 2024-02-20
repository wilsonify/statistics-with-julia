using Test
using CSV, Distributions, HypothesisTests, DataFrames
using io_library: read_machine_data
using c06_confidence: confidence_interval_two_pop_known_var_formula

@testset "confidence_interval_two_pop_known_var_formula" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../../data")
    data1 = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")[:,1]
    data2 = read_machine_data("$(@__DIR__)/../../../data/machine2.csv")[:,1]
    xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    sig1, sig2 = 1.2, 1.6
    alpha = 0.05
    z = quantile(Normal(),1 - alpha / 2)
    result = confidence_interval_two_pop_known_var_formula(data1, data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end