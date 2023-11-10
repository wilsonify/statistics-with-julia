# Creating and inspecting a DataFrame
using DataFrames, CSV
using Test
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

@testset "DataFrame" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test size(data) == (200, 4)
    @test names(data) == ["Name", "Date", "Grade", "Price"]
    expected_data = DataFrame(Grade = ["A", "B", "E", missing, "C", "D"],
        Price = [79700, missing, 24311, 38904, 47052, 34365],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"])
    @test are_dataframes_equal(first(data, 6), expected_data)
end
