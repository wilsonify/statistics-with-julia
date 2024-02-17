#=
estimate the bias of σˆ2 and σ̂ via Monte Carlo simulation.
σ̂ is biased; however, it is asymptotically unbiased.
as the sample size grows, the bias tends to zero.
=#

using Random, Statistics

using Random, Statistics


trueVar = 1 / 12
trueStd = sqrt(1 / 12)
N = 10^7

function estVar(n)
    # a sensible estimate of population variance where the population mean is known
    sample = rand(n)
    sum((sample .- 0.5).^2) / n
end

using Test

@testset "end_to_end" begin
Random.seed!(0)
    result = estVar(10)
    result = round(result,digits = 1)
    @test result == 0.1
end

@testset "end_to_end" begin
Random.seed!(0)
n = 30
biasVar = mean([estVar(n) for _ in 1:N]) - trueVar
biasStd = mean([sqrt(estVar(n)) for _ in 1:N]) - trueStd
@test round(biasVar,digits = 2) == 0.0
@test round(biasStd,digits = 2) == -0.0

end

Random.seed!(0)

trueVar, trueStd = 1 / 12, sqrt(1 / 12)


function main_l0507_stdVarBiasEstimate()
    N = 10^7

    # loop over sample sizes n = 5, 10, 15, . . . , 30,
    for n in 5:5:30
        println("n = ",n)
        # for each size repeat N experiments and estimate the bias.
        biasVar = mean([estVar(n) for _ in 1:N]) - trueVar
        biasVar_human = round(biasVar, digits = 5)
        println("Var bias: ", biasVar_human)

        biasStd = mean([sqrt(estVar(n)) for _ in 1:N]) - trueStd
        biasStd_human = round(biasStd, digits = 5)
        println("Std bias: ", biasStd_human)


    end
end