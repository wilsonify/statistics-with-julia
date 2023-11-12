using DataFrames, CSV, Dates, Statistics, CategoricalArrays
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")
read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

function preprocess_purchaseData(data)
    data = dropmissing(data)
    data[!, :Date] = Date.(data[!, :Date], "d/m/y")
    #categorical!(data, :Grade)
    # categorical! function is not defined in the DataFrames package.
    # Instead, you should use the CategoricalArray constructor
    # to convert a column to a categorical data type.
    data[!, :Grade] = CategoricalArray(data[!, :Grade])
    return data
end

function summarize_purchaseData(data)
    #result = by(data, :Grade, :Price => x -> ( NumSold = length(x), AvgPrice = mean(x)) )   )
    #result = combine(groupby(data, :Grade), :Price => x -> (NumSold = length(x), AvgPrice = mean(x))) )
    result = combine(groupby(data, :Grade), :Price => x -> (length(x), mean(x)))
    return result
end

function main()
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    summary = summarize_purchaseData(df)

    println(first(sort(data, :Date), 3), "\n")
    println(first(filter(row -> row[:Price] > 50000, data), 3), "\n")
    println(first(data, 3), "\n")
    println(summary)
end

using Test
@testset "sort test" begin
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    expected_data = DataFrame(Grade = ["D", "E", "C"],
        Price = [33155, 8257, 46911],
        Date = [Date("2008-02-11"), Date("2008-02-12"), Date("2008-03-03")],
        Name = ["STEPHEN", "JACKELINE", "ARDELL"])
    @test are_dataframes_equal(first(sort(df, :Date), 3), expected_data)
end

@testset "filter test" begin
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    result = first(filter(row -> row[:Price] > 50000, df), 3)
    expected_data = DataFrame(Grade = ["A", "A", "B"],
        Price = [79700, 79344, 61730],
        Date = [Date("2008-09-14"), Date("2008-08-15"), Date("2008-11-05")],
        Name = ["MARYANNA", "NOE", "SAMMIE"])
    @test dataframe_to_dict(result) == dataframe_to_dict(expected_data)
end

@testset "preprocess_purchaseData test" begin
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    expected_data = DataFrame(Grade = ["A", "E", "C"],
        Price = [79700, 24311, 47052],
        Date = [Date("2008-09-14"), Date("2008-08-05"), Date("2008-12-01")],
        Name = ["MARYANNA", "ASHELY", "TANJA"])
    @test dataframe_to_dict(first(df, 3)) == dataframe_to_dict(expected_data)
end

@testset "summarize_purchaseData test" begin
    df = read_purchaseData()
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
