using Statistics
using DataFrames
using CSV
using Test
using c04_data: calculate_mean_price_no_missing
using c04_data: calculate_nanmean_price
using c04_data: sum_is_missing_name
using c04_data: replace_all_missing_grades
using c04_data: dropmissing_price
using c04_data: findall_complete
using TestingLibrary: are_lists_equal
using TestingLibrary: are_dataframes_equal

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

@testset "calculate_mean_price_no_missing test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    @test ismissing(calculate_mean_price_no_missing(data))
end

@testset "calculate_nanmean_price test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    @test round(calculate_nanmean_price(data), digits = 2) == 39702.01
end

@testset "sum_is_missing test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    @test sum_is_missing_name(data) == 17
end

@testset "replace_all_missing_grades test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    @test replace_all_missing_grades(data).Grade[1:4] == ["A", "B", "E", "QQ"]
end

@testset "dropmissing test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    expected_data = DataFrame(
        Name = Union{Missing, String}[ "MARYANNA", "ASHELY", "KHADIJAH", "TANJA"],
        Date = Union{Missing, String}["14/09/2008", "5/08/2008", "2/09/2008", "1/12/2008"],
        Grade = Union{Missing, String}["A", "E", missing, "C"],
        Price = Union{Int64, Missing}[79700, 24311, 38904, 47052])
    @test are_dataframes_equal(first(dropmissing(data, :Price), 4), expected_data)
end

@testset "findall test" begin
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    expected_data = [1, 3, 5, 6]
    @test are_lists_equal(findall_complete(data)[1:4], expected_data)
end
