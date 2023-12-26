using DataFrames
using CSV
using Statistics
using Test
using Random
using StatisticsWithJulia: keep_complete_grade_and_price
using StatisticsWithJulia: replace_all_missing_names
using StatisticsWithJulia: replace_all_missing_dates
using StatisticsWithJulia: enrich_data_with_summary
using StatisticsWithJulia.TestingLibrary: are_dataframes_equal
using StatisticsWithJulia: preprocess_purchaseData1
using StatisticsWithJulia.TestingLibrary: dataframe_to_dict
using StatisticsWithJulia.IOLibrary: read_purchaseData
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")


@testset "summarize_purchaseData test" begin
    Random.seed!(0)
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = keep_complete_grade_and_price(df)
    df = replace_all_missing_names(df)
    df = replace_all_missing_dates(df)
    df = preprocess_purchaseData1(df)
    grouped_df = summarize_purchaseData1(df)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "E", "C", "D", "B"],
        :Price_function => [76000.0, 21000.0, 45000.0, 35000.0, 60000.0]))
    @test dataframe_to_dict(first(grouped_df, 5)) == dataframe_to_dict(expected_data)
end

@testset "enrich_data_with_summary test" begin
    Random.seed!(0)
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = keep_complete_grade_and_price(df)
    df = replace_all_missing_names(df)
    df = replace_all_missing_dates(df)
    df = preprocess_purchaseData1(df)
    df = enrich_data_with_summary(df)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "B", "E", "D", "C"],
        :Price => [79700, 60000, 24311, 38904, 47052],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA"]))
    @test dataframe_to_dict(first(df, 5)) == dataframe_to_dict(expected_data)
end