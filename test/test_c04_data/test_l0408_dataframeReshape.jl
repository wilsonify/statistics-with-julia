using DataFrames
using CSV
using StatisticsWithJulia: horizontal_concatenate
using StatisticsWithJulia: vertical_concatenate
using StatisticsWithJulia: join_on_name
using StatisticsWithJulia.TestingLibrary: are_dataframes_equal

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

using Test
@testset "hcat axis=1 test" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    newCol = DataFrame(Validated = ones(Int, size(data, 1)))
    data = horizontal_concatenate(data, newCol)
    expected_data = DataFrame(Dict{Symbol, Vector{Any}}(:Grade => ["A", "B", "E"],
        :Price => [79700, missing, 24311],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008"],
        :Validated => [1, 1, 1],
        :Name => ["MARYANNA", "REBECCA", "ASHELY"]))
    @test are_dataframes_equal(first(data, 3), expected_data)
end

@testset "vcat axis=0 test" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    data = vertical_concatenate(data, newRow)
    expected_data = DataFrame(Dict{Symbol, Vector{Any}}(:Grade => ["E", missing, missing],
        :Price => [21842, missing, missing],
        :Date => ["30/12/2008", missing, missing],
        :PhoneNo => [missing, 123456, 909595],
        :Name => ["RIVA", "JOHN", "JACK"]))
    @test are_dataframes_equal(last(data, 3), expected_data)
end

@testset "leftjoin test" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = join_on_name(data, newData)
    expected_data = DataFrame(Grade = ["A", "E", "B"],
        Price = [79700, 24311, missing],
        Date = ["14/09/2008", "5/08/2008", "11/03/2008"],
        Job = ["Lawyer", "Doctor", missing],
        Name = ["MARYANNA", "ASHELY", "REBECCA"])
    @test are_dataframes_equal(first(result, 3), expected_data)
end

@testset "select test" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = join_on_name(data, newData)
    select!(result, [:Name, :Job])
    expected_data = DataFrame(Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"])
    @test are_dataframes_equal(first(data, 3), expected_data)
end

@testset "unique test" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])
    result = join_on_name(data, newData)
    unique!(result, :Job)
    expected_data = DataFrame(Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"])
    @test are_dataframes_equal(first(data, 3), expected_data)
end
