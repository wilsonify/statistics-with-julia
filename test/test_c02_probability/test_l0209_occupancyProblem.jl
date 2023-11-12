# An occupancy problem
using Plots ; pyplot()

occupancyAnalytic(n, r) = sum([(-1)^k*binomial(n,k) * (1 - k / n)^r for k in 0:n])

function occupancyMC(n, r, N)
    fullCount = 0
    for _ in 1:N
        envelopes = zeros(Int,n)
        for k in 1:r
            target = rand(1:n)
            envelopes[target] += 1
        end
        numFilled = sum(envelopes .> 0)
        if numFilled == n
            fullCount += 1
        end
    end
    return fullCount / N
end

function main()
    max_n, N, Kvals = 100, 10^3, [2, 3, 4]
    analytic = [[occupancyAnalytic(big(n),big(k*n)) for n in 1:max_n] for k in Kvals]
    monteCarlo = [[occupancyMC(n,k*n,N) for n in 1:max_n] for k in Kvals]
    plot(1:max_n, analytic, c = [:blue :red :green], label = ["K=2" "K=3" "K=4"])
    scatter!(1:max_n, monteCarlo, mc = :black, shape = :+, label = "", xlims = (0,max_n),ylims = (0,1), xlabel = "n Envelopes", ylabel = "Probability", legend = :topright)
end

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
    @test result==0.85
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


