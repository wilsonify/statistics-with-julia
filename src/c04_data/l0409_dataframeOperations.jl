# Manipulating DataFrame objects

using DataFrames
using CSV
using Dates
using Statistics
using CategoricalArrays

read_purchaseData(path_to_purchaseData) = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

function select_non_missing(data)
    # some function require all values to be non-missing.
    # exclude all rows with missing entries
    return dropmissing(data)
end

function cast_string_to_Date(data)
    # the Date() function from the Dates package is applied to every row from the :Date column,
    # converting each entry from a string to a Date type,
    # according to the string formatting given as the second argument.
    data[!, :Date] = Date.(data[!, :Date], "d/m/y")
    return data
end

function sort_on_date_ascending(data)
    # sort() is used to sort by the :Date column.
    return sort(data, :Date)
end

function select_Price_greater_than_50000(data)
    # filter() is used to return only rows which have a :Price greater than 50000.
    return filter(row -> row[:Price] > 50000, data)
end

function cast_grade_to_categorical(data)
    # the type of the :Grade column is changed to categorical via categorical!().
    # categorical! function is not defined in the DataFrames package.
    # Instead, you should use the CategoricalArray constructor to convert a column to a categorical data type.
    # categorical!(data, :Grade)
    data[!, :Grade] = CategoricalArray(data[!, :Grade])
    return data
end

function preprocess_purchaseData(data)
    data = select_non_missing(data)
    data = cast_string_to_Date(data)
    data = cast_grade_to_categorical(data)
    return data
end

function summarize_purchaseData(data)
    # the powerful groupby() function is demonstrated.
    # Here data is split according to :Grade.
    # The third argument is where calculations are defined.
    # The columns to be referenced in the calculations are put to the left of “=>”,
    # in our case only :Price is used.
    # The calculations are specified by the anonymous function in line 14.
    # Note that => is used to define a Pair and -> is used to define an anonymous function.
    # The anonymous function creates a NamedTuple defining two new columns, :NumSold and :AvgPrice.
    # For the first,
    # the total number of each :Grade is calculated based on the length,
    # i.e. number of entries in the price column.
    # For the second, the average price is calculated via mean().
    # Note that the by() function can be used in many ways,
    # and calculations can be done over data in more than one column.
    # There are also several other related functions not touched on here,
    # including mapcols(),
    # which can be used to transform all values in a data frame,
    # and aggregate(),
    # which has functionality similar to by().
    # Further functionality is also available via the DataFramesMeta package which provides a macro-based framework to interface with data frames,
    # such as via the @linq macro and the |> operator.
    # Consult the documentation for further information.

    # by(data, :Grade, :Price => x -> ( NumSold = length(x), AvgPrice = mean(x)) )
    # combine(groupby(data, :Grade), :Price => x -> (NumSold = length(x), AvgPrice = mean(x)))
    return combine(groupby(data, :Grade), :Price => x -> (length(x), mean(x)))
    end

function main_dataframe_ops()
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    summary = summarize_purchaseData(df)

    println(first(sort(data, :Date), 3), "\n")
    println(first(filter(row -> row[:Price] > 50000, data), 3), "\n")
    println(first(data, 3), "\n")
    println(summary)
end

function main_l0409_dataframeOperations()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    data = select_non_missing(data)
    data = cast_string_to_Date(data)
    data = sort_on_date_ascending(data)
    println(first(data, 3))
    data = select_Price_greater_than_50000(data)
    println(first(data,3 ))
    data = cast_grade_to_categorical(data)
    println(first(data, 3))
    data = summarize_purchaseData(data)
    println( data )
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0409_dataframeOperations()
end

using DataFrames
using CSV
using Dates
using Statistics
using CategoricalArrays
path_to_here = @__DIR__
include("$path_to_here/../t01_testing/t01_are_dataframes_equal.jl")
include("$path_to_here/../t01_testing/t02_are_lists_equal.jl")
include("$path_to_here/../t01_testing/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

using Test
@testset "sort test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData(df)
    expected_data = DataFrame(Grade = ["D", "E", "C"],
        Price = [33155, 8257, 46911],
        Date = [Date("2008-02-11"), Date("2008-02-12"), Date("2008-03-03")],
        Name = ["STEPHEN", "JACKELINE", "ARDELL"])
    @test are_dataframes_equal(first(sort(df, :Date), 3), expected_data)
end

@testset "filter test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData(df)
    result = first(filter(row -> row[:Price] > 50000, df), 3)
    expected_data = DataFrame(Grade = ["A", "A", "B"],
        Price = [79700, 79344, 61730],
        Date = [Date("2008-09-14"), Date("2008-08-15"), Date("2008-11-05")],
        Name = ["MARYANNA", "NOE", "SAMMIE"])
    @test dataframe_to_dict(result) == dataframe_to_dict(expected_data)
end

@testset "preprocess_purchaseData test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData(df)
    expected_data = DataFrame(Grade = ["A", "E", "C"],
        Price = [79700, 24311, 47052],
        Date = [Date("2008-09-14"), Date("2008-08-05"), Date("2008-12-01")],
        Name = ["MARYANNA", "ASHELY", "TANJA"])
    @test dataframe_to_dict(first(df, 3)) == dataframe_to_dict(expected_data)
end

@testset "summarize_purchaseData test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData(df)
    summary_df = summarize_purchaseData(df)
    expected_data = DataFrame(Grade = ["A", "B", "C", "D", "E"],
        Price_function = [
            (15, 76606.73333333334),
            (19, 59873.89473684211),
            (33, 45285.84848484849),
            (35, 34656.828571428574),
            (51, 20492.50980392157),
        ])
    @test dataframe_to_dict(summary_df) == dataframe_to_dict(expected_data)
end
