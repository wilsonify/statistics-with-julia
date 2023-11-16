using CSV, Distributions, HypothesisTests, DataFrames

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_machine(n) = CSV.read("$path_to_data/machine$n.csv", DataFrame, header = false)[:,1]

function confidence_interval_formula(data1, data2)
    alpha = 0.05
    xBar1, xBar2 = mean(data1), mean(data2)
    s1, s2 = std(data1), std(data2)
    n1, n2 = length(data1), length(data2)
    v = (s1^2 / n1 + s2^2 / n2)^2 / ( (s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1) )
    t = quantile(TDist(v),1 - alpha / 2)
    lower = xBar1 - xBar2 - t*sqrt(s1^2 / n1 + s2^2 / n2)
    upper = xBar1 - xBar2 + t*sqrt(s1^2 / n1 + s2^2 / n2)
    return (lower, upper)
    end

function confidence_interval_builtin(data1, data2)
    alpha = 0.05
    return confint(UnequalVarianceTTest(data1,data2),level = 1 - alpha,tail = :both)
    end

using Test
@testset "read_machine" begin
    data = read_machine("1")
    @test length(data) == 20
end

@testset "confidence_interval_formula" begin
    data1 = read_machine("1")
    data2 = read_machine("2")
    result = confidence_interval_formula(data1,data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end

@testset "confidence_interval_builtin" begin
    data1 = read_machine("1")
    data2 = read_machine("2")
    result = confidence_interval_builtin(data1, data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end

@testset "matching" begin
    data1 = read_machine("1")
    data2 = read_machine("2")
    cif = confidence_interval_formula(data1,data2)
    cif = round.(cif,digits = 2)
    cib = confidence_interval_builtin(data1,data2)
    cib = round.(cib,digits = 2)
    @test cib == cif
end