using DataFrames, CSV

path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

using Test
@testset "hcat test" begin
    data = read_purchaseData()
    newCol = DataFrame(Validated = ones(Int, size(data, 1)))
    data = hcat(data, newCol)
    expected_data = DataFrame(Dict{Symbol, Vector{Any}}(:Grade => ["A", "B", "E"],
        :Price => [79700, missing, 24311],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008"],
        :Validated => [1, 1, 1],
        :Name => ["MARYANNA", "REBECCA", "ASHELY"]))
    @test are_dataframes_equal(first(data, 3), expected_data)
end

@testset "vcat test" begin
    data = read_purchaseData()
    newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    data = vcat(data, newRow, cols = :union)
    expected_data = DataFrame(Dict{Symbol, Vector{Any}}(:Grade => ["E", missing, missing],
        :Price => [21842, missing, missing],
        :Date => ["30/12/2008", missing, missing],
        :PhoneNo => [missing, 123456, 909595],
        :Name => ["RIVA", "JOHN", "JACK"]))
    @test are_dataframes_equal(last(data, 3), expected_data)
end

@testset "leftjoin test" begin
    data = read_purchaseData()
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = leftjoin(data, newData, on = :Name, matchmissing = :notequal)
    expected_data = DataFrame(Grade = ["A", "E", "B"],
        Price = [79700, 24311, missing],
        Date = ["14/09/2008", "5/08/2008", "11/03/2008"],
        Job = ["Lawyer", "Doctor", missing],
        Name = ["MARYANNA", "ASHELY", "REBECCA"])
    @test are_dataframes_equal(first(result, 3), expected_data)
end

@testset "select test" begin
    data = read_purchaseData()
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = leftjoin(data, newData, on = :Name, matchmissing = :notequal)

    select!(result, [:Name, :Job])
    expected_data = DataFrame(Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"])
    @test are_dataframes_equal(first(data, 3), expected_data)
end

@testset "unique test" begin
    data = read_purchaseData()
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = leftjoin(data, newData, on = :Name, matchmissing = :notequal)
    unique!(result, :Job)
    expected_data = DataFrame(Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"])
    @test are_dataframes_equal(first(data, 3), expected_data)
end
