# Editing and copying a DataFrame
#=
In lines 2–3,
two dataframes are created,
the first data1 has immutable columns,
while data2 has mutable columns due to the second argument in CSV.read().
In line 5,
we try to change the value of the first row and first column in data1.
This is done within the try/catch structure.
If an error occurs within try, the code jumps to catch and continues.
Since data1 is immutable, an error is returned, and so the code after catch runs.
Here, we use the @warn macro to return a warning.
In line 7,
we try the same change for data2,
and since this data frame is mutable,
we are able to make the change.
In line 10,
we perform division on every row element in the :Price column of data1 by using ! to reference all rows.
By using this syntax,
the underlying :Price column data is referenced,
and the column changed to mutable,
which then allows us to make make the change.
The actual change is done via the combination of the broadcast “.” operator,
which extends the in-place division via \ = to each row.
Note the column type changes from Int64 to Float64.
In line 11, rename!() is used to rename the :Price column as shown, with a pair of values,
separated via =>, given as the second argument.
Finally, in line 14,
replace!() is used to replace all D and E entries in the :Grade column to E and F respectively.
Note that replace!() operates on an iterable,
hence the use of the ... splat operator,
and finally,
note that the order of replacement does not matter,
as the replacement does not advance one after the other sequentially.
Again note that ! was used for row referencing.
=#
using DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame)
data2 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

try data1[1, :Name] = "YARDEN" catch; @warn "Cannot: data1 is immutable" end 

data2[1, :Name] = "YARDEN"
println("\n", first(data2, 3), "\n")

data1[!, :Price] ./= 1000 
rename!(data1, :Price => Symbol("Price(000's)"))
println(first(data1, 3), "\n")

replace!(data2[!, :Grade], ["E" => "F", "D" => "E"]...)
println(first(data2, 3),"\n")

using DataFrames, CSV
using Test

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

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

    expected_data = DataFrame(Name = ["YARDEN", "REBECCA", "ASHELY"],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311])
    @test are_dataframes_equal(first(data1, 3), expected_data)
end

@testset "maybe_set_first_name Test" begin
    data2 = read_purchaseData2()
    data2 = maybe_set_first_name(data2)
    expected_data = DataFrame(Name = ["YARDEN", "REBECCA", "ASHELY"],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008"],
        Grade = ["A", "B", "E"],
        Price = [79700, missing, 24311])
    @test are_dataframes_equal(first(data2, 3), expected_data)
end

@testset "normalize_price Test" begin
    data1 = read_purchaseData1()
    data1 = normalize_price(data1)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "B", "E"],
        Symbol("Price(000's)") => [79.7, missing, 24.311],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY"]))
    @test are_dataframes_equal(first(data1, 3), expected_data)
end

@testset "recode_grade Test" begin
    data2 = read_purchaseData2()
    data2 = recode_grade(data2)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "B", "F"],
        :Price => [79700, missing, 24311],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY"]))
    @test are_dataframes_equal(first(data2, 3), expected_data)
end
