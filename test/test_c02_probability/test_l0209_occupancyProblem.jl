using StatisticsWithJulia: occupancyAnalytic
using StatisticsWithJulia: occupancyMC
using Test, Random

@testset "occupancyAnalytic Tests" begin
    Random.seed!(1)
    result = occupancyAnalytic(6, 10^6)
    result = round(result,digits=2)
    @test result==1.0
end
@testset "occupancyMC Tests" begin
    Random.seed!(1)
    result = occupancyMC(10, 40, 100)
    result = round(result,digits=2)
    @test isapprox(result,0.85,atol=0.1)
end

@testset "test_occupancy_problem" begin
    max_n, N, Kvals = 100, 10^3, [2, 3, 4]
    for (i, k) in enumerate(Kvals)
        for n in 1:max_n
            analytic_result = occupancyAnalytic(big(n), big(k * n))
            monte_carlo_result = occupancyMC(n, k * n, N)
            @test isapprox(analytic_result, monte_carlo_result, atol=0.1)
        end
    end
end


