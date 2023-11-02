using DataFrames, CSV
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")

function read_purchaseData1()
    data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame)
end

function read_purchaseData2()
    data2 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
end

function maybe_set_first_name(df)
    try
        df[1, :Name] = "YARDEN"
    catch
        @warn "Cannot: data1 is immutable"
    end
    return df
end

function normalize_price(df)
    df[!, :Price] ./= 1000
    rename!(df, :Price => Symbol("Price(000's)"))
    return df
end

function recode_grade(df)
    replace!(df[!, :Grade], ["E" => "F", "D" => "E"]...)
    return df
end

@testset "maybe_set_first_name Test" begin
    data1 = read_purchaseData1()
    data1 = maybe_set_first_name(data1)

    expected_data = DataFrame(
        Name = Union{Missing, String15}["YARDEN", "REBECCA", "ASHELY"],
        Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = Union{Missing, String15}["A", "B", "E"],
        Price = Union{Int64, Missing}[79700, missing, 24311])
    @test are_dataframes_equal(first(data1, 3), expected_data)
    end

@testset "maybe_set_first_name Test" begin
    data2 = read_purchaseData2()
    data2 = maybe_set_first_name(data2)
    expected_data = DataFrame(
        Name = Union{Missing, String15}["YARDEN", "REBECCA", "ASHELY"],
        Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = Union{Missing, String15}["A", "B", "E"],
        Price = Union{Int64, Missing}[79700, missing, 24311])
    @test are_dataframes_equal(first(data2, 3), expected_data)
end

@testset "normalize_price Test" begin
    data1 = read_purchaseData1()
    data1 = normalize_price(data1)
    expected_data = DataFrame(
        Name = Union{Missing, String15}["YARDEN", "REBECCA", "ASHELY"],
        Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = Union{Missing, String15}["A", "B", "E"],
        Symbol("Price(000's)") = Union{Int64, Missing}[79700, missing, 24311])
    @test are_dataframes_equal(first(data1, 3),expected_data)
end

@testset "recode_grade Test" begin
    data2 = read_purchaseData2()
    data2 = recode_grade(data2)
    expected_data = DataFrame(
        Name = Union{Missing, String15}["YARDEN", "REBECCA", "ASHELY"],
        Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = Union{Missing, String15}["A", "B", "E"],
        Price = Union{Int64, Missing}[79700, missing, 24311])
    @test are_dataframes_equal(first(data2, 3),expected_data)
end
