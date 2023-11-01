# Let us mention here the difference between
# the standard String type in Julia and the String7 or String15 types.
#
# The types with number suffix denote strings that have a fixed width
# (similar to CHAR(N) type provided by many data bases).
# Such strings are much faster to work with (especially if you have many of them)
# than the standard String type because their instances are not heap allocated.
#
# For this reason CSV.read by default reads in narrow string columns using these fixed-width types.

using DataFrames, CSV
using Test

reference_data = DataFrame(
    Name = Union{Missing, String15}["MARYANNA", "REBECCA", "KHADIJAH"],
    Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "2/09/2008"],
    Grade = Union{Missing, String15}["A", "B", missing],
    Price = Union{Int64, Missing}[79700, missing, 38904]
)

reference_names = DataFrame(
    Name = Union{Missing, String15}["SAMMIE", missing, "STACEY"]
)
@testset "" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test data[1, 3] == "A"
    @test data[1, :Grade] == "A"
    @test data.Grade[1] == "A"
    @test data[[1, 2, 4], :] == reference_data
    @test data[13:15, :Name] == reference_names.Name
    @test data.Name[13:15] == reference_names.Name
    @test data[13:15, [:Name]] == reference_names.Name
end
