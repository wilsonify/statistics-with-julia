using Distributions, Random, Plots
n, N, alpha = 3, 10^7, 0.1
xGrid = -5:0.1:5

myT(nObs) = rand(Normal()) / sqrt(rand(Chisq(nObs - 1)) / (nObs - 1))

function compute_mcQuantile(N, n)
    mcQuantile = quantile([myT(n) for _ in 1:N],alpha)
    return mcQuantile
    end

function compute_analyticQuantile(n)
    analyticQuantile = quantile(TDist(n - 1),alpha)
    return analyticQuantile
    end

function plot_quantiles()
    plot(xGrid, pdf.(Normal(), xGrid), c = :black, label = "Normal Distribution")
    scatter!(xGrid, pdf.(TDist(1) ,xGrid),  c = :blue, msw = 0, label = "DOF = 1")
    scatter!(xGrid, pdf.(TDist(3), xGrid),  c = :red, msw = 0, label = "DOF = 3")
    scatter!(xGrid, pdf.(TDist(100),xGrid),  c = :green, msw = 0, label = "DOF = 100", xlims = (-4,4), ylims = (0,0.5), xlabel = "X", ylabel = "Density")
    end

@testset "myT test" begin
    Random.seed!(0)
    result = myT(3)
    result = round(result, digits=2)
    @test result > 0.0
    @test result < 3
end

@testset "compute_mcQuantile test" begin
Random.seed!(0)
mcQuantile = compute_mcQuantile(10^3,3)
mcQuantile = round(mcQuantile,digits=2)
@test isapprox(mcQuantile,-1.88,atol=0.1)
end

@testset "compute_analyticQuantile test" begin
Random.seed!(0)
analyticQuantile = compute_analyticQuantile(n)
@test isapprox(analyticQuantile,-1.88,atol=0.1)
end

@testset "end-to-end" begin
Random.seed!(0)

mcQuantile = compute_mcQuantile(N,n)
println("Quantile from Monte Carlo: ", mcQuantile)

analyticQuantile = compute_analyticQuantile(n)
println("Analytic qunatile: ", analyticQuantile)

end