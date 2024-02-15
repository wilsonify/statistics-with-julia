# Let us mention here the difference between
# the standard String type in Julia and the String7 or String15 types.
#
# The types with number suffix denote strings that have a fixed width
# (similar to CHAR(N) type provided by many data bases).
# Such strings are much faster to work with (especially if you have many of them)
# than the standard String type because their instances are not heap allocated.
#
# For this reason CSV.read by default reads in narrow string columns using these fixed-width types.

using StatisticsWithJulia: get_grade1,get_grade2,get_grade3
using StatisticsWithJulia: get_names1,get_names2,get_names3
using StatisticsWithJulia.TestingLibrary: are_dataframes_equal
using StatisticsWithJulia.TestingLibrary: are_lists_equal
using StatisticsWithJulia: read_purchaseData
using StatisticsWithJulia: get_purchases
using DataFrames
using CSV
using InlineStrings # we need String15 available for testing
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

@testset "String15" begin
    @test typeof(String15("SAMMIE")) == String15
end

@testset "get_grade1" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test get_grade1(data) == "A"
end

@testset "get_grade2" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test get_grade2(data) == "A"
end

@testset "get_grade3" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test get_grade3(data) == "A"
end

@testset "get_purchases" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    reference_data = DataFrame(Name = ["MARYANNA", "REBECCA", "KHADIJAH"],
    Date = ["14/09/2008", "11/03/2008", "2/09/2008"],
    Grade = ["A", "B", missing],
    Price = [79700, missing, 38904])
    @test are_dataframes_equal(get_purchases(data), reference_data)
end

@testset "get_names1" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    reference_names_list = Union{Missing, String15}[String15("SAMMIE"), missing, String15("STACEY")]
    @test are_lists_equal(get_names1(data), reference_names_list)
end

@testset "get_names2" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    reference_names_list = Union{Missing, String15}[String15("SAMMIE"), missing, String15("STACEY")]
    @test are_lists_equal(get_names2(data), reference_names_list)
end

@testset "get_names3" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    reference_names_list = Union{Missing, String15}[String15("SAMMIE"), missing, String15("STACEY")]
    reference_names = DataFrame(Name = reference_names_list)
    @test are_dataframes_equal(get_names3(data), reference_names)
end
