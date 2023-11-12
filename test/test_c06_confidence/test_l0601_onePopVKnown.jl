using CSV, Distributions, HypothesisTests, DataFrames
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

sig = 1.2
alpha = 0.1

read_machine(number) = CSV.read("$path_to_data/machine$number.csv", DataFrame, header = false)[:,1]

function summarize(data)
    n = length(data)
    xBar = mean(data)
    z = quantile(Normal(),1 - alpha / 2)
    return n,xBar,z
end

function Calculating_formula(data)
    n,xBar,z = summarize(data)
    confidence_interval = (xBar - z*sig / sqrt(n), xBar + z*sig / sqrt(n))
    return confidence_interval
    end

function builtin_formula(data)
    n,xBar,z = summarize(data)
    return confint(OneSampleZTest(xBar,sig,n),level = 1 - alpha,tail = :both)
end

@testset "read_machine" begin
data = read_machine(1)
@test length(data) == 20
end

@testset "summarize" begin
data = read_machine(1)
n,xBar,z = summarize(data)
@test n == 20
end

@testset "Calculating_formula" begin
data = read_machine(1)
n,xBar,z = summarize(data)
ci = Calculating_formula(data)
ci = round.(ci,digits=2)
@test ci == (52.51, 53.40)
end

@testset "builtin_formula" begin
data = read_machine(1)
n,xBar,z = summarize(data)
ci2=builtin_formula(data)
ci2 = round.(ci2,digits=2)
@test ci2 == (52.51, 53.40)
end