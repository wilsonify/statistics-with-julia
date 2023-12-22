# Creating and inspecting a DataFrame
using DataFrames # use the DataFrames package to use DataFrame type objects.
using CSV # We also use the CSV package for reading csv files.

function read_purchaseData(path_to_purchaseData)
    return CSV.read(path_to_purchaseData, DataFrame, copycols = true)
end

function get_size(data)
    # the size() function returns the number of rows and columns of the data frame as a tuple.
    println(nrow(data))
    println(ncol(data))
    return size(data)
    end

function get_column_names(data)
    # the names() function is used to return an array of all column names as symbols.
    return names(data)
end

function get_head(data)
    # the first() function is used to display the first six lines of the data frame, as specified by the second argument.
    return first(data, 6)
end

function get_tail(data)
    # last() can be used to display the last several rows instead.
    return last(data, 6)
    end

function get_description(data)
    # describe() is used to create a data frame with a
    # summary of the data in each column of the input data frame.
    return describe(data)
    end



function main_l0403_dataframeInspection()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    print("path_to_data=$path_to_data")
    # create a data frame object, populated with data from the file specified.
    # Note that our file has a header row,
    # We use copycols = true to create a data frame with mutable columns (the default is false).
    # if copycols = false, each column would be a read-only CSV.Column.
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    println(get_size(data))
    println(get_column_names(data))
    println(get_head(data))
    println(get_tail(data))
    println(get_description(data))
    # there are missing values present based on the nmissing column
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0403_dataframeInspection()
end

export read_purchaseData
export get_size
export get_column_names
export get_head
export get_tail
export get_description
export are_dataframes_equal

