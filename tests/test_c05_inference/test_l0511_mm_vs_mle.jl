# Method of Moments vs
using Distributions, Plots

trueA = -2
trueB = 5
MLEest(data) = maximum(data)
MMest(data) = mean(data) + sqrt(3) * std(data)

function generate_data_uniform(n, A, B)
    trueDist = Uniform(A, B)
    rand(trueDist,n)
    end

function run_simulation(nMax)
    N = 10^5
    nMin, nStep = 10, 10
    nn = Int(nMax / nStep)
    sampleSizes = nMin:nStep:nMax
    res = Dict{Symbol,Array{Float64}}(
        :sampleSize => Array{Float64}(undef,nn),
        :MSeMLE => Array{Float64}(undef,nn),
        :MSeMM => Array{Float64}(undef,nn),
        :VarMLE => Array{Float64}(undef,nn),
        :VarMM => Array{Float64}(undef,nn),
        :BiasMLE => Array{Float64}(undef,nn),
        :BiasMM => Array{Float64}(undef,nn)
        )

    for (i, n) in enumerate(sampleSizes)
        mleEst, mmEst = Array{Float64}(undef, N), Array{Float64}(undef, N)
        for j in 1:N
            sample = generate_data_uniform(n,trueA,trueB)
            mleEst[j] = MLEest(sample)
            mmEst[j] = MMest(sample)
        end
        meanMLE, meanMM = mean(mleEst), mean(mmEst)
        varMLE, varMM = var(mleEst), var(mmEst)
        res[:sampleSize][i] = n
        res[:MSeMLE][i] = varMLE + (meanMLE - trueB)^2
        res[:MSeMM][i] = varMM + (meanMM - trueB)^2
        res[:VarMLE][i] = varMLE
        res[:VarMM][i] = varMM
        res[:BiasMLE][i] = meanMLE - trueB
        res[:BiasMM][i] = meanMM - trueB
    end
    return res
end

function plot_results(res)
    p1 = scatter(res[:sampleSize], [res[:MSeMLE] res[:MSeMM]], c = [:blue :red],    label = ["Mean sq.err (MLE)" "Mean sq.err (MM)"])
    p2 = scatter(res[:sampleSize], [res[:VarMLE] res[:VarMM]], c = [:blue :red],    label = ["Variance (MLE)" "Variance (MM)"])
    p3 = scatter(res[:sampleSize], [res[:BiasMLE] res[:BiasMM]], c = [:blue :red],    label = ["Bias (MLE)" "Bias (MM)"])
    plot(p1, p2, p3, ms = 10, shape = :xcross, xlabel = "n",    layout = (1,3), size = (1200, 400))
end

using Test, Random
@testset "MLEest test" begin
    Random.seed!(0)
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    @test round(MLEest(sample),digits = 2) == 4.37

end

@testset "MMest test" begin
    Random.seed!(0)
    trueDist = Uniform(-2, 5)
    sample = rand(trueDist,5)
    @test round(MMest(sample),digits = 2) == 5.73
end
@testset "generate_data_uniform" begin
    Random.seed!(0)
    result = generate_data_uniform(5,2,5)
    result = round.(result,digits = 2)
    @test result == [4.47, 4.73, 2.49, 2.53, 2.84]
end

@testset "end_to_end" begin
res = run_simulation(200)
plot_results(res)
end