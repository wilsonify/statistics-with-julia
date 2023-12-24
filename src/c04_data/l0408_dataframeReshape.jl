# Reshaping, joining and merging data frames

using DataFrames
using CSV

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

function horizontal_concatenate(data::DataFrame, newCol::DataFrame)
    # Check if the number of rows in data and newCol matches
    if size(data, 1) != size(newCol, 1)
        throw(DimensionMismatch("The number of rows in data ($(size(data, 1))) and newCol $(size(newCol, 1)) must match"))
    end

    # Check if the columns in data and newCol have the same names
    if any(isequal(names(data), names(newCol)))
        println("Columns in data and newCol same names.")
    end

    # Perform horizontal concatenation
    result = hcat(data, newCol)

    return result
end

function vertical_concatenate(data::DataFrame, newRow::DataFrame)
    # Perform vertical concatenation
    result = vcat(data, newRow, cols = :union)
    return result
end

function join_on_name(data, newData)
    # join data and newData together, based on the :Name column.
    # Note that join() can be used in several different ways.
    # innerjoin: the output contains rows for values of the key that exist in all passed data frames.
    # leftjoin: the output contains rows for values of the key that exist in the first (left) argument,
    # whether or not that value exists in the second (right) argument.
    # rightjoin: the output contains rows for values of the key that exist in the second (right) argument,
    # whether or not that value exists in the first (left) argument.
    # outerjoin: the output contains rows for values of the key that exist in any of the passed data frames.
    # semijoin: Like an inner join, but output is restricted to columns from the first (left) argument.
    # antijoin: The output contains rows for values of the key that exist in the first (left) but not the second (right) argument.
    # As with semijoin, output is restricted to columns from the first (left) argument.
    # crossjoin: The output is the cartesian product of rows from all passed data frames.
    return leftjoin(data, newData, on = :Name, matchmissing = :notequal)
end

function main_l0408_dataframeReshape()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # create data
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

    # create three separate data frames.
    # The first consists of a single column with the same number of rows as data.
    newCol = DataFrame(Validated = ones(Int, size(data,1)))
    # The second consists of two rows with :Name and :PhoneNumber columns.
    newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
    # The third has two rows and two columns, :Name and :Job.
    newData = DataFrame(Name = ["JOHN", "ASHELY", "MARYANNA"], Job = ["Lawyer", "Doctor", "Lawyer"])

    # horizontally concatenate newCol to data.
    data = horizontal_concatenate(data, newCol)
    println(first(data, 3))

    # vertically concatenate newRow, with the new row appended to the bottom of the data frame.
    data = vertical_concatenate(data, newRow)
    println(last(data, 3), "\n")

    # join data and newData together, based on the :Name column.
    # Note that join() can be used in several different ways.
    data = join_on_name(data, newData)
    println(data, "\n")

    # The functions select!() and unique!() are demonstrated.
    select!(data,[:Name, :Job])
    println(data, "\n")

    unique!(data,:Job)
    println(data)
    # Another function not shown here is stack(),
    # which can be used to stack a data frame from a wide format to a long format.
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0408_dataframeReshape()
end

using DataFrames
using CSV

path_to_here = @__DIR__
include("$path_to_here/../t01_testing/t01_are_dataframes_equal.jl")
include("$path_to_here/../t01_testing/t02_are_lists_equal.jl")
include("$path_to_here/../t01_testing/t04_dataframe_to_dict.jl")

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
