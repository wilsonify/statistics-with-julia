# Handling missing entries
#=
In line 4,
we attempt to calculate the mean of the :Price column of data,
however missing is returned as this column contains missing values.
By comparison,
in line 5,
skipmissing() is first used to return a copy of the data
from the :Price column which has no missing entries, and after this mean() applied.
In line 6, data.Grade is used to obtain a reference to the :Grade column,
and then the coalesce() function is used to replace all missing values with the string “QQ”.
The first four values are accessed via [1:4] to verify the replacement has occurred.
In line 7, dropmissing() is used to drop all rows which have missing in the :Price column.
If no second argument is given, dropmissing() will drop all rows that contain missing.
In line 8, ismissing() is used with the broadcast operator to check
if values in the :Name column are missing.
If they are, true is returned, else false.
Then sum() is used to calculate how many missing entries are present.
The result, 17,
can be verified from the output of Listing 4.3 where we see the number of missing entries.
In line 9,
completecases() is used to check if each row contains fully completed fields,
i.e. no missing values.
If no missing values are present,
true is returned,
else false,
for each row.
Then findall() is used on this array to return an array of row indexes which have no missing values,
and to shorten the output,
the first four values of this array are printed.
=#
using Statistics, DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

println(mean(data.Price),"\n")
println(mean(skipmissing(data.Price)),"\n")
println(coalesce.(data.Grade, "QQ")[1:4],"\n")
println(first(dropmissing(data,:Price), 4),"\n")
println(sum(ismissing.(data.Name)),"\n")
println(findall(completecases(data))[1:4])

using Statistics, DataFrames, CSV
using Test

path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

@testset "skipmissing test" begin
    data = read_purchaseData()
    @test ismissing(mean(data.Price))
    @test round(mean(skipmissing(data.Price)), digits = 2) == 39702.01
    @test sum(ismissing.(data.Name)) == 17
end

@testset "coalesce test" begin
    data = read_purchaseData()
    expected_data = ["A", "B", "E", "QQ"]
    @test coalesce.(data.Grade, "QQ")[1:4] == expected_data
    #@test are_lists_equal(coalesce.(data.Grade, "QQ")[1:4], expected_data)
end

@testset "dropmissing test" begin
    data = read_purchaseData()
    expected_data = DataFrame(Name = Union{Missing, String}["MARYANNA",
            "ASHELY",
            "KHADIJAH",
            "TANJA"],
        Date = Union{Missing, String}["14/09/2008", "5/08/2008", "2/09/2008", "1/12/2008"],
        Grade = Union{Missing, String}["A", "E", missing, "C"],
        Price = Union{Int64, Missing}[79700, 24311, 38904, 47052])
    @test are_dataframes_equal(first(dropmissing(data, :Price), 4), expected_data)
end

@testset "findall test" begin
    data = read_purchaseData()
    expected_data = [1, 3, 5, 6]
    @test are_lists_equal(findall(completecases(data))[1:4], expected_data)
end
