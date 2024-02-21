using Test,Random
using Test
using c05_inference: ts

function generate_simulation_data()
    end

function compute_rejectionValue(n, N, alpha)
    dist0 = Uniform(0,1)
    empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]
    rejectionValue = quantile(empiricalDistUnderH0,alpha)
    rejectionValue = round(rejectionValue,digits = 2)
    return rejectionValue
    end

function compute_testStat(n, N, alpha, mActual)
    dist0 = Uniform(0,1)
    empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]
    rejectionValue = quantile(empiricalDistUnderH0,alpha)
    dist1 = Uniform(0,mActual)
    sample = rand(dist1,n)
    testStat = ts(sample)
end

function compute_pValue(n, N, alpha, mActual)
    dist0 = Uniform(0,1)
    empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]
    rejectionValue = quantile(empiricalDistUnderH0,alpha)
    dist1 = Uniform(0,mActual)
    sample = rand(dist1,n)
    testStat = ts(sample)
    pValue = sum(empiricalDistUnderH0 .<= testStat) / N
    pValue = round(pValue,digits = 2)
end

@testset "rejectionValue" begin
    n, N, alpha = 10, 10^7, 0.05
    mActual = 0.75
    result = compute_rejectionValue(n, N, alpha)
    @test result == 0.61
    end

@testset "pValue" begin
    Random.seed!(2)
    n, N, alpha = 10, 10^7, 0.05
    mActual = 0.75
    result = compute_pValue(n, N, alpha, mActual)
    @test result == 0.01
end

@testset "end_to_end" begin
    Random.seed!(2)
    n, N, alpha = 10, 10^7, 0.05
    mActual = 0.75
    dist0 = Uniform(0,1)
    empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]

    testStat = compute_testStat(n, N, alpha, mActual)
    rejectionValue = compute_rejectionValue(n, N, alpha)
    pValue = compute_pValue(n, N, alpha, mActual)

    if pValue < alpha
        print("Reject: ", round(testStat,digits = 4))
        print(" <= ", round(rejectionValue,digits = 4))
        println("\np-value = $(round(pValue,digits = 4))")
    elseif pValue >= alpha
        print("Didn't reject: ", round(testStat,digits = 4))
        print(" > ", round(rejectionValue,digits = 4))
        println("\np-value = $(round(pValue,digits = 4))")
    end

    stephist(empiricalDistUnderH0, bins = 100, c = :blue, normed = true, label = "")
    plot!([testStat, testStat], [0, 4], c = :red, label = "Observed test statistic")
    plot!([rejectionValue, rejectionValue], [0, 4], c = :black, ls = :dash,    label = "Critical value boundary", legend = :topleft, ylims = (0,4),        xlabel = "x", ylabel = "Density")
end
