using Distributions
using StatisticsWithJulia: myT

@testset "myT test" begin
    
    result = myT(3)
    result = round(result, digits=2)
    @test result > 0.0
    @test result < 3
end

@testset "compute_mcQuantile test" begin

mcQuantile = compute_mcQuantile(10^3,3)
mcQuantile = round(mcQuantile,digits=2)
@test isapprox(mcQuantile,-1.88,atol=0.1)
end

@testset "compute_analyticQuantile test" begin

analyticQuantile = compute_analyticQuantile(n)
@test isapprox(analyticQuantile,-1.88,atol=0.1)
end

@testset "end-to-end" begin


mcQuantile = compute_mcQuantile(N,n)
println("Quantile from Monte Carlo: ", mcQuantile)

analyticQuantile = compute_analyticQuantile(n)
println("Analytic qunatile: ", analyticQuantile)

end
