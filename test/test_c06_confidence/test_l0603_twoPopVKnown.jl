using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_machine(n) = CSV.read("$path_to_data/machine$n.csv", DataFrame, header = false)[:,1]

function confidence_interval_formula(data1, data2)
    alpha = 0.05
    xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    sig1, sig2 = 1.2, 1.6
    z = quantile(Normal(),1 - alpha / 2)
    lower = xBar1 - xBar2 - z*sqrt(sig1^2 / n1 + sig2^2 / n2)
    upper = xBar1 - xBar2 + z*sqrt(sig1^2 / n1 + sig2^2 / n2)
    return (lower,upper)
    end

@testset "end_to_end" begin
    data1 = read_machine("1")
    data2 = read_machine("2")
    xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    sig1, sig2 = 1.2, 1.6
    alpha = 0.05
    z = quantile(Normal(),1 - alpha / 2)
    result = confidence_interval_formula(data1, data2)
    result = round.(result,digits = 2)
    @test result == (1.1, 2.92)
end