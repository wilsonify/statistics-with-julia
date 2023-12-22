# Creating and inspecting a DataFrame
using StatisticsWithJulia: get_size
using StatisticsWithJulia: get_column_names
using StatisticsWithJulia: get_head
using StatisticsWithJulia: get_tail
using StatisticsWithJulia: get_description
using StatisticsWithJulia: are_dataframes_equal
using DataFrames
using CSV
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

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
    expected_data = DataFrame(Grade = ["A", "B", "E", missing, "C", "D"],
        Price = [79700, missing, 24311, 38904, 47052, 34365],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"])
    @test are_dataframes_equal(get_tail(data), expected_data)
end

@testset "get_description" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    expected_data = DataFrame(Grade = ["A", "B", "E", missing, "C", "D"],
        Price = [79700, missing, 24311, 38904, 47052, 34365],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"])
    @test are_dataframes_equal(get_description(data), expected_data)
end