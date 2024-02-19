using DataFrames
using CSV
using Statistics
using Test
using Random
using c04_data: keep_complete_grade_and_price, replace_all_missing_names, replace_all_missing_dates, enrich_data_with_summary, summarize_purchaseData2
using testing_library: are_dataframes_equal, dataframe_to_dict
using io_library: read_purchaseData

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

@testset "summarize_purchaseData2 test" begin
    Random.seed!(0)
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = keep_complete_grade_and_price(df)
    df = replace_all_missing_names(df)
    df = replace_all_missing_dates(df)
    grouped_df = summarize_purchaseData2(df)
    expected_data = DataFrame(
        Grade = ["A", "B", "C", "D", "E"],
        Price_function = [76000.0, 60000.0, 45000.0, 35000.0, 21000.0]
    )
    # Sort both DataFrames by Grade before comparison
    grouped_df = sort(grouped_df, :Grade)
    expected_data = sort(expected_data, :Grade)
    @test dataframe_to_dict(grouped_df) == dataframe_to_dict(expected_data)
end


@testset "enrich_data_with_summary test" begin
    Random.seed!(0)
    df = read_purchaseData("$path_to_data/purchaseData.csv")
    df = keep_complete_grade_and_price(df)
    df = replace_all_missing_names(df)
    df = replace_all_missing_dates(df)
    df = enrich_data_with_summary(df)
    expected_data = DataFrame(
        Grade = ["A", "A", "A", "A", "A"],
        Price = [79700, 79344, 79888, 77968, 77071],
        Date = ["14/09/2008", "15/08/2008", "18/07/2008", "21/11/2008", "4/10/2008"],
        Name = ["MARYANNA", "NOE", "PAIGE", "DELPHINE", "PIERRE"]
    )
    # Sort both DataFrames by Grade before comparison
    df = sort(df, :Grade)
    df = first(df, 5)
    expected_data = sort(expected_data, :Grade)
    @test dataframe_to_dict(df) == dataframe_to_dict(expected_data)
end

