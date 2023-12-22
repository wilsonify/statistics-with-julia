# Referencing data in a DataFrame
using DataFrames, CSV

function get_grade1(data)
    # the rows and columns to be extracted are designated by the first and second arguments
    return data[1, 3]
    end

function get_grade2(data)
    return data[1, :Grade]
    end

function get_grade3(data)
    return data.Grade[1]
    end

function get_purchases(data)
    # : can be used to select all
    return data[[1, 2, 4], :]
    end

function get_names1(data)
    # a unit range is used to select rows 13–15,
    # the symbol :Name is used so that only the Name column is extracted.
    return data[13:15, :Name]
    end

function get_names2(data)
    # the column selected first
    # creates an array,
    return data.Name[13:15]
    end

function get_names3(data)
    # the extra set of [] creates a data frame object
    return data[13:15, [:Name]]
    end

function main_l0404_dataframeReferencing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    # different ways of accessing the element from the first row and third column labeled :Date.
    println("Grade of person 1: ", get_grade1(data))
    println("Grade of person 1: ", get_grade2(data))
    println("Grade of person 1: ", get_grade3(data))
    println("Purchases of persons 1,2,4", get_purchases(data))
    println("Names:", get_names1(data))
    println("Names:", get_names2(data))
    println("Names:", get_names3(data))
end

if abspath(PROGRAM_FILE) == @__FILE__
    using StatisticsWithJulia: read_purchaseData
    main_l0404_dataframeReferencing()
end

export get_grade1
export get_grade2
export get_grade3
export get_names1
export get_names2
export get_names3

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
using StatisticsWithJulia: are_dataframes_equal
using StatisticsWithJulia: are_lists_equal
using StatisticsWithJulia: read_purchaseData
using DataFrames
using CSV
using InlineStrings # we need String15 available for testing
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

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
