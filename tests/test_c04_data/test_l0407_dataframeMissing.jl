using Statistics, DataFrames, CSV
using Test

path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

@testset "skipmissing test" begin
    data = read_purchaseData()
    @test ismissing(mean(data.Price))
    @test round(mean(skipmissing(data.Price)),digits = 2) == 39702.01
    @test sum(ismissing.(data.Name)) == 17
end

@testset "coalesce test" begin
    data = read_purchaseData()
    expected_data = ["A", "B", "E", "QQ"]
    @test are_lists_equal(coalesce.(data.Grade, "QQ")[1:4],expected_data)
end

@testset "dropmissing test" begin
    data = read_purchaseData()
    expected_data = DataFrame(
       Name = Union{Missing, String}["MARYANNA", "ASHELY", "KHADIJAH", "TANJA"],
       Date = Union{Missing, String}["14/09/2008","5/08/2008","2/09/2008","1/12/2008"],
       Grade = Union{Missing, String}["A", "E", missing,"C"],
       Price = Union{Int64, Missing}[79700, 24311, 38904, 47052],
    )
    @test are_dataframes_equal(first(dropmissing(data, :Price), 4),expected_data)
end

@testset "findall test" begin
    data = read_purchaseData()
    expected_data = [1,3,5,6]
    @test are_lists_equal(findall(completecases(data))[1:4],expected_data)
end
