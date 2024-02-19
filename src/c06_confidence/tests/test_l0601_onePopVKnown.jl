using Test
using DataFrames
using c06_confidence: summarize_n_xBar_z
using c06_confidence: confidence_interval_known_variance
using c06_confidence: confidence_interval_known_variance_builtin
using io_library: read_machine_data

@testset "read_machine" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    @test nrow(data) == 20
end

@testset "summarize_n_xBar_z" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data_col = data[:,1]
    @test typeof(data_col)==Array{Float64,1}
    n,xBar,z = summarize_n_xBar_z(data_col)
    @test n == 20
end

@testset "Calculating_formula" begin
    data = read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data_col = data[:,1]
    n,xBar,z = summarize_n_xBar_z(data_col)
    ci = confidence_interval_known_variance(data_col)
    ci = round.(ci,digits = 2)
    @test ci == (52.51, 53.40)
end

@testset "builtin_formula" begin
    data=read_machine_data("$(@__DIR__)/../../../data/machine1.csv")
    data_col = data[:,1]
    n,xBar,z = summarize_n_xBar_z(data_col)
    ci2 = confidence_interval_known_variance_builtin(data_col)
    ci2 = round.(ci2,digits = 2)
    @test ci2 == (52.51, 53.40)
end