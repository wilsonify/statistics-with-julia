using DataFrames, CSV

path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/..``/../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

using Test
@testset "hcat test" begin
    data = read_purchaseData()
    newCol = DataFrame(Validated = ones(Int, size(data, 1)))
    data = hcat(data, newCol)
    expected_data = DataFrame( Dict{Symbol, Vector{Any}}(
      :Grade => [String1("A"), String1("B"), String1("E")],
      :Price => [79700, missing, 24311],
      :Date => [String15("14/09/2008"), String15("11/03/2008"), String15("5/08/2008")],
      :Validated => [1, 1, 1],
      :Name => [String15("MARYANNA"), String15("REBECCA"), String15("ASHELY")]
      ))
    @test are_dataframes_equal(first(data, 3),expected_data)
end

using Test
@testset "vcat test" begin
    data = read_purchaseData()
    newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
    newData = DataFrame( Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    data = vcat(data, newRow, cols = :union)
    expected_data = DataFrame( Dict{Symbol, Vector{Any}}(
        :Grade => [String1("E"), missing, missing],
        :Price => [21842, missing, missing],
        :Date => [String15("30/12/2008"), missing, missing],
        :PhoneNo => [missing, 123456, 909595],
        :Name => [String15("RIVA"), "JOHN", "JACK"])
    )
    @test are_dataframes_equal(last(data, 3),expected_data)
end

using Test
@testset "leftjoin test" begin
    data = read_purchaseData()
    newData = DataFrame( Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = leftjoin(data, newData, on = :Name, matchmissing = :notequal)
    @test result==""
end

using Test
@testset "select test" begin
    data = read_purchaseData()
    select!(data, [:Name, :Job])
    @test dataframe_to_dict(first(data,3)) == ""
end

using Test
@testset "unique test" begin
    data = read_purchaseData()
    unique!(data, :Job)
    @test dataframe_to_dict(first(data,3)) == ""
end