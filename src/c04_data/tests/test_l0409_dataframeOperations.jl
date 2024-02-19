using DataFrames
using CSV
using Dates
using Statistics
using CategoricalArrays
using StatisticsWithJuliac.c04_data: select_non_missing
using c04_data: cast_string_to_Date
using c04_data: sort_on_date_ascending
using c04_data: select_Price_greater_than_50000
using c04_data: cast_grade_to_categorical
using c04_data: summarize_purchaseData1
using testing_library: dataframe_to_dict
using testing_library: are_dataframes_equal
using c04_data: preprocess_purchaseData1
using io_library: read_purchaseData
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")


using Test
@testset "sort test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData1(df)
    expected_data = DataFrame(Grade = ["D", "E", "C"],
        Price = [33155, 8257, 46911],
        Date = [Date("2008-02-11"), Date("2008-02-12"), Date("2008-03-03")],
        Name = ["STEPHEN", "JACKELINE", "ARDELL"])
    @test are_dataframes_equal(first(sort(df, :Date), 3), expected_data)
end

@testset "filter test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData1(df)
    result = first(filter(row -> row[:Price] > 50000, df), 3)
    expected_data = DataFrame(Grade = ["A", "A", "B"],
        Price = [79700, 79344, 61730],
        Date = [Date("2008-09-14"), Date("2008-08-15"), Date("2008-11-05")],
        Name = ["MARYANNA", "NOE", "SAMMIE"])
    @test dataframe_to_dict(result) == dataframe_to_dict(expected_data)
end

@testset "preprocess_purchaseData test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData1(df)
    expected_data = DataFrame(Grade = ["A", "E", "C"],
        Price = [79700, 24311, 47052],
        Date = [Date("2008-09-14"), Date("2008-08-05"), Date("2008-12-01")],
        Name = ["MARYANNA", "ASHELY", "TANJA"])
    @test dataframe_to_dict(first(df, 3)) == dataframe_to_dict(expected_data)
end

@testset "summarize_purchaseData test" begin
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = preprocess_purchaseData1(df)
    summary_df = summarize_purchaseData1(df)
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
