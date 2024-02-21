using Test
using testing_library: dataframe_to_dict
using io_library: read_fertilizer
using c05_inference: compute_pval

@testset "read_fertilizer" begin
    data = read_fertilizer("$(@__DIR__)/../../../data/fertilizer.csv")
    expected_data = Dict(
        :Control => [4.17, 5.58, 5.18],
        :FertilizerX => [6.31, 5.12, 5.54]
    )
    @test dataframe_to_dict(first(data,3)) == expected_data
end

@testset "end_to_end" begin
    data = read_fertilizer("$(@__DIR__)/../../../data/fertilizer.csv")
    pVal = compute_pval(data)
    pVal = round(pVal,digits=2)
    @test pVal==0.02
end