using Random, Statistics


trueVar = 1 / 12
trueStd = sqrt(1 / 12)
N = 10^7

function estVar(n)
    sample = rand(n)
    return sum((sample .- 0.5).^2) / n
end

using Test

@testset "end_to_end" begin
Random.seed!(0)
    result = estVar(10)
    result = round(result,digits = 2)
    @test result == 0.10
end

@testset "end_to_end" begin
Random.seed!(0)
n = 30
biasVar = mean([estVar(n) for _ in 1:N]) - trueVar
biasStd = mean([sqrt(estVar(n)) for _ in 1:N]) - trueStd
@test round(biasVar,digits = 2) == 0.0
@test round(biasStd,digits = 2) == -0.0

end