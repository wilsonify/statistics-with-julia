# Creating and inspecting a DataFrame
using StatisticsWithJulia: get_size
using StatisticsWithJulia: get_column_names
using StatisticsWithJulia: get_head
using StatisticsWithJulia: get_tail
using StatisticsWithJulia: get_description
using StatisticsWithJulia.TestingLibrary: are_dataframes_equal
using StatisticsWithJulia.TestingLibrary: dataframe_to_dict
using DataFrames
using CSV
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

@testset "get_size" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test get_size(data) == (200, 4)
end

@testset "get_column_names" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test get_column_names(data) == ["Name", "Date", "Grade", "Price"]
end

@testset "get_head" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    expected_data = DataFrame(Grade = ["A", "B", "E", missing, "C", "D"],
        Price = [79700, missing, 24311, 38904, 47052, 34365],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"])
    @test are_dataframes_equal(get_head(data), expected_data)
end

@testset "get_tail" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    expected_data = DataFrame(
    Grade = ["E", "C", "E", "D", "D", "E"],
    Price = [20707, 39388, 21586, 31062, 35538, 21842],
    Date = ["20/03/2008", "12/11/2008", "10/07/2008", "5/05/2008", "6/10/2008", "30/12/2008"],
    Name = ["PATRINA", "DAYSI", "CARISA", "MARINDA", "MERRILEE", "RIVA"]
    )
    @test are_dataframes_equal(get_tail(data),expected_data)
end

@testset "get_description" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    expected_data = DataFrame(
        eltype = [Union{Missing, String15}, Union{Missing, String15}, Union{Missing, String1}, Union{Missing, Int64}],
        median = [nothing, nothing, nothing, 38045.5],
        max = ["ZACHARY", "9/10/2008", "E", 79893],
        variable = [:Name, :Date, :Grade, :Price],
        mean = [nothing, nothing, nothing, 39702.01075268817],
        nmissing = [17, 4, 13, 14],
        min = ["ABBEY", "1/07/2008", "A", 8257]
    )
    @test are_dataframes_equal(get_description(data),expected_data)
end