using DataFrames, CSV
using Test
using StatisticsWithJulia: read_purchaseData_immutable
using StatisticsWithJulia: read_purchaseData_mutable
using StatisticsWithJulia: maybe_set_first_name
using StatisticsWithJulia: division_on_every_price
using StatisticsWithJulia: rename_price
using StatisticsWithJulia: recode_grade
using StatisticsWithJulia: are_dataframes_equal

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")


@testset "maybe_set_first_name immutable Test" begin
    data1 = read_purchaseData_immutable("$path_to_data/purchaseData.csv")
    data1 = maybe_set_first_name(data1)
    expected_data = DataFrame(
        Name = ["YARDEN", "REBECCA", "ASHELY"],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311])
    @test are_dataframes_equal(first(data1,3), expected_data)
end

@testset "maybe_set_first_name mutable Test" begin
    data2 = read_purchaseData_mutable("$path_to_data/purchaseData.csv")
    data2 = maybe_set_first_name(data2)
    expected_data = DataFrame(
        Name = ["YARDEN", "REBECCA", "ASHELY"],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311])
    @test are_dataframes_equal(first(data2, 3), expected_data)
end

@testset "division_on_every_price Test" begin
    data1 = read_purchaseData_immutable("$path_to_data/purchaseData.csv")
    data1 = division_on_every_price(data1)
    data1 = rename_price(data1)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(
        :Grade => ["A", "B", "E"],
        Symbol("Price(000's)") => [79.7, missing, 24.311],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY"]))
    @test are_dataframes_equal(first(data1, 3), expected_data)
end

@testset "recode_grade Test" begin
    data2 = read_purchaseData_mutable("$path_to_data/purchaseData.csv")
    data2 = recode_grade(data2)
    expected_data = DataFrame(
        Grade = ["A", "B", "F"],
        Price = [79700, missing, 24311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"]
    )
    @test are_dataframes_equal(first(data2, 3), expected_data)
end
