# Let us mention here the difference between
# the standard String type in Julia and the String7 or String15 types.
#
# The types with number suffix denote strings that have a fixed width
# (similar to CHAR(N) type provided by many data bases).
# Such strings are much faster to work with (especially if you have many of them)
# than the standard String type because their instances are not heap allocated.
#
# For this reason CSV.read by default reads in narrow string columns using these fixed-width types.

using DataFrames
using CSV
using InlineStrings # we need String15 available for testing
using Test


path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")

reference_data = DataFrame(Name = ["MARYANNA", "REBECCA", "KHADIJAH"],
    Date = ["14/09/2008", "11/03/2008", "2/09/2008"],
    Grade = ["A", "B", missing],
    Price = [79700, missing, 38904])

reference_names_list = Union{Missing, String15}[String15("SAMMIE"), missing, String15("STACEY")]

reference_names = DataFrame(Name = reference_names_list)

@testset "end-to-end" begin
    @test typeof(String15("SAMMIE")) == String15
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test data[1, 3] == "A"
    @test data[1, :Grade] == "A"
    @test data.Grade[1] == "A"
    @test are_dataframes_equal(data[[1, 2, 4], :], reference_data)
    @test are_lists_equal(data[13:15, :Name], reference_names_list)
    @test are_lists_equal(data.Name[13:15], reference_names_list)
    @test are_dataframes_equal(data[13:15, [:Name]], reference_names)
end
