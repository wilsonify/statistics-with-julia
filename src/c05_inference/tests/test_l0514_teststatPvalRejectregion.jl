using Test, Random
using c05_inference: ts
using c05_inference: generate_simulation_data
using c05_inference: compute_rejectionValue
using c05_inference: compute_pValue
using c05_inference: compute_testStat

@testset "rejectionValue" begin
    sim_data = generate_simulation_data(10, 10^7, 0.05)
    result = compute_rejectionValue(sim_data)
    @test result == 0.61
end

@testset "pValue" begin
    Random.seed!(2)
    sim_data = generate_simulation_data(10, 10^7, 0.05)
    sim_data.mActual = 0.75
    result = compute_pValue(sim_data)
    @test result == 0.01
end

@testset "end_to_end" begin
    Random.seed!(2)
    sim_data = generate_simulation_data(10, 10^7, 0.05)
    sim_data.mActual = 0.75

    testStat = compute_testStat(sim_data)
    rejectionValue = compute_rejectionValue(sim_data)
    pValue = compute_pValue(sim_data)

    if pValue < sim_data.alpha
        println("Reject: ", round(testStat, digits=4), " <= ", round(rejectionValue, digits=4))
        println("p-value = ", round(pValue, digits=4))
    else
        println("Didn't reject: ", round(testStat, digits=4), " > ", round(rejectionValue, digits=4))
        println("p-value = ", round(pValue, digits=4))
    end

    stephist(sim_data.empiricalDistUnderH0, bins=100, c=:blue, normed=true, label="")
    plot!([testStat, testStat], [0, 4], c=:red, label="Observed test statistic")
    plot!([rejectionValue, rejectionValue], [0, 4], c=:black, ls=:dash, label="Critical value boundary", legend=:topleft, ylims=(0, 4), xlabel="x", ylabel="Density")
end
