# Referencing data in a DataFrame
using DataFrames, CSV

function main_l0404_dataframeReferencing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    # different ways of accessing the element from the first row and third column labeled :Date.

    println("Grade of person 1: ", data[1, 3],  ", ", data[1,:Grade],  ", ", data.Grade[1], "\n")

    # the rows and columns to be extracted are designated by the first and second arguments, [1,2,4], and “:”, respectively.
    # Note that “:” can be used to select either all rows or all columns.

    println(data[[1,2,4], :], "\n")
    # is somewhat similar,
    # but here a unit range is used to select rows 13–15,
    # while the symbol :Name is used so that only the Name column is extracted.
    # Alternatively, the column could have been referenced by its index,
    # i.e. data[13:15, 1],
    # or the syntax data.Name[13:15]
    # could have been used instead.
    # Note that although lines 9 and 10 look similar,
    # there is an important difference.
    # The code in line 9 creates an array,
    # while that of line 10 creates a data frame object,
    # due to the extra set of [].
    # If one wanted,
    # additional columns could also be selected by including them in [],
    # separated by “,”.
    println(data[13:15, :Name], "\n")
    println(data.Name[13:15], "\n")
    println(data[13:15, [:Name]])
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0404_dataframeReferencing()
end
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
