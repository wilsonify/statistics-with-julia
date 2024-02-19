using Test
using .TestingLibrary: dataframe_to_dict
using io_library: read_fertilizer

@testset "read_fertilizer" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_fertilizer("$path_to_data/fertilizer.csv")
    expected_data = Dict(
        :Control => [4.17, 5.58, 5.18],
        :FertilizerX => [6.31, 5.12, 5.54]
    )
    @test dataframe_to_dict(first(data,3)) == expected_data
end

@testset "end_to_end" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_fertilizer("$path_to_data/fertilizer.csv")
    pVal = compute_pval(data)
    pVal = round(pVal,digits=2)
    @test pVal==0.02
end