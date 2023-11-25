using Test
using StatisticsWithJulia: even_sum_probability
@testset "Test even_sum_probability function" begin
    numSol, mcEst = even_sum_probability()
    numSol = round(numSol,digits=2)
    mcEst = round(mcEst,digits=2)
    @test numSol == 0.5
    @test mcEst == 0.50
end
