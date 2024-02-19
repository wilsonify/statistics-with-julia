# Reshaping, joining and merging data frames

using DataFrames
using CSV
using io_library: read_purchaseData


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
    data = read_purchaseData("$path_to_data/purchaseData.csv")

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

export horizontal_concatenate
export vertical_concatenate
export join_on_name

