using Test

@testset "end_to_end" begin
Random.seed!(0)
    trueVar = 1 / 12
    trueStd = sqrt(1 / 12)
    N = 10^7

    result = estVar(10)
    result = round(result,digits = 1)
    @test result == 0.1
end

@testset "end_to_end" begin
    trueVar = 1 / 12
    trueStd = sqrt(1 / 12)
    N = 10^7
    n = 30
    biasVar = mean([estVar(n) for _ in 1:N]) - trueVar
    biasStd = mean([sqrt(estVar(n)) for _ in 1:N]) - trueStd
    @test round(biasVar,digits = 2) == 0.0
    @test round(biasStd,digits = 2) == -0.0

end
