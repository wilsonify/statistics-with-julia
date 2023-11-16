using DataFrames, CSV, Distributions, HypothesisTests
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_machine(n) = CSV.read("$path_to_data/machine$n.csv", DataFrame, header = false)[:,1]

function confidence_interval_formula(data)
    alpha = 0.1
    xBar, n = mean(data), length(data)
    s = std(data)
    t = quantile(TDist(n - 1),1 - alpha / 2)
    lower = xBar - t*s / sqrt(n)
    upper = xBar + t*s / sqrt(n)
    return (lower, upper)
    end

function confidence_interval_builtin(data)
    alpha = 0.1
    xBar, n = mean(data), length(data)
    s = std(data)
    t = quantile(TDist(n - 1),1 - alpha / 2)
    return confint(OneSampleTTest(xBar,s,n), level = 1 - alpha, tail = :both)
end

using Test
@testset "read_machine" begin
    data = read_machine("1")
    @test length(data) == 20
end
@testset "confidence_interval_formula" begin
    data = read_machine("1")
    result = confidence_interval_formula(data)
    result = round.(result,digits = 2)
    @test result == (52.5, 53.41)
end
@testset "confidence_interval_builtin" begin
    data = read_machine("1")
    result = confidence_interval_builtin(data)
    result = round.(result,digits = 2)
    @test result == (52.5, 53.41)
end
@testset "confidence_interval_builtin" begin
    data = read_machine("1")
    cif = confidence_interval_formula(data)
    cif = round.(cif,digits = 2)
    cib = confidence_interval_builtin(data)
    cib = round.(cib,digits = 2)
    @test cib == cif
end
