# Editing and copying a DataFrame

using DataFrames, CSV

function read_purchaseData_immutable(path_to_purchaseData)
    # has immutable columns
    return CSV.read(path_to_purchaseData, DataFrame)
end

function read_purchaseData_mutable(path_to_purchaseData)
    # has mutable columns
    return CSV.read(path_to_purchaseData, DataFrame, copycols = true)
end

function maybe_set_first_name(data)
    # try to change the value of the first row and first column.
    try
        # Since data1 is immutable, an error is returned
        data[1, :Name] = "YARDEN"
    catch;
        # use the @warn macro to give a warning.
        @warn "Cannot: data1 is immutable"
    end
end

function division_on_every_price(data)
    # perform division on every row element in the :Price column of data1
    # By using !, the underlying :Price column data is referenced, and the column becomes mutable,
    # Note the column type changes from Int64 to Float64.
    data[!, :Price] ./= 1000 # using ! to reference all rows. and . to broadcast
    return data
    end

function rename_price(data)
    # rename!() is used to rename the :Price column as shown, with a pair of values,
    # separated via =>, given as the second argument.
    rename!(data, :Price => Symbol("Price(000's)"))
    return data
end

function recode_grade(data)
    # replace!() is used to replace all D and E entries in the :Grade column to E and F respectively.
    # Note that replace!() operates on an iterable,
    # hence the use of the ... splat operator,
    # note that the order of replacement does not matter, replacement is not sequential.
    replace!(data[!, :Grade], ["E" => "F", "D" => "E"]...) # ! was used for row referencing
    return data
end
function main_l0405_dataframeEditing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    # create two dataframes
    data1 = read_purchaseData_immutable("$path_to_data/purchaseData.csv")
    data2 = read_purchaseData_mutable("$path_to_data/purchaseData.csv")

    # try to change data1. Since data1 is immutable, an error is encountered
    data1 = maybe_set_first_name(data1)
    println(first(data1, 3))

    # try to change data2. Since data2 is mutable, the change is made.
    data2 = maybe_set_first_name(data2)
    println(first(data2, 3))

    # perform division on every row element in the :Price column of data1
    data1 = division_on_every_price(data1)
    println(first(data1, 3), "\n")

    data1 = rename_price(data1)
    println(first(data1, 3), "\n")

    data2 = recode_grade(data2)
    println(first(data2, 3),"\n")

end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0405_dataframeEditing()
end


export read_purchaseData_immutable
export read_purchaseData_mutable
export maybe_set_first_name
export division_on_every_price
export rename_price
export recode_grade


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
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

@testset "maybe_set_first_name immutable Test" begin
    data1 = read_purchaseData_immutable("$path_to_data/purchaseData.csv")
    data1 = maybe_set_first_name(data1)
    expected_data = DataFrame(
        Name = ["YARDEN", "REBECCA", "ASHELY"],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311])
    @test are_dataframes_equal(first(data1, 3), expected_data)
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

@testset "normalize_price Test" begin
    data1 = read_purchaseData_immutable("$path_to_data/purchaseData.csv")
    data1 = normalize_price(data1)
    expected_data = DataFrame(
        Grade = ["A", "B", "E"],
        Symbol("Price(000's)") = [79.7, missing, 24.311],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY"]
    )
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
