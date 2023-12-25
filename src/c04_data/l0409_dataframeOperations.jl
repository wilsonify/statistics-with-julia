# Manipulating DataFrame objects

using DataFrames
using CSV
using Dates
using Statistics
using CategoricalArrays

read_purchaseData(path_to_purchaseData) = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

function select_non_missing(data)
    # some function require all values to be non-missing.
    # exclude all rows with missing entries
    return dropmissing(data)
end

function cast_string_to_Date(data)
    # the Date() function from the Dates package is applied to every row from the :Date column,
    # converting each entry from a string to a Date type,
    # according to the string formatting given as the second argument.
    data[!, :Date] = Date.(data[!, :Date], "d/m/y")
    return data
end

function sort_on_date_ascending(data)
    # sort() is used to sort by the :Date column.
    return sort(data, :Date)
end

function select_Price_greater_than_50000(data)
    # filter() is used to return only rows which have a :Price greater than 50000.
    return filter(row -> row[:Price] > 50000, data)
end

function cast_grade_to_categorical(data)
    # the type of the :Grade column is changed to categorical via categorical!().
    # categorical! function is not defined in the DataFrames package.
    # Instead, you should use the CategoricalArray constructor to convert a column to a categorical data type.
    # categorical!(data, :Grade)
    data[!, :Grade] = CategoricalArray(data[!, :Grade])
    return data
end

function preprocess_purchaseData(data)
    data = select_non_missing(data)
    data = cast_string_to_Date(data)
    data = cast_grade_to_categorical(data)
    return data
end

function summarize_purchaseData(data)
    # the powerful groupby() function is demonstrated.
    # Here data is split according to :Grade.
    # The third argument is where calculations are defined.
    # The columns to be referenced in the calculations are put to the left of “=>”,
    # in our case only :Price is used.
    # The calculations are specified by the anonymous function in line 14.
    # Note that => is used to define a Pair and -> is used to define an anonymous function.
    # The anonymous function creates a NamedTuple defining two new columns, :NumSold and :AvgPrice.
    # For the first,
    # the total number of each :Grade is calculated based on the length,
    # i.e. number of entries in the price column.
    # For the second, the average price is calculated via mean().
    # Note that the by() function can be used in many ways,
    # and calculations can be done over data in more than one column.
    # There are also several other related functions not touched on here,
    # including mapcols(),
    # which can be used to transform all values in a data frame,
    # and aggregate(),
    # which has functionality similar to by().
    # Further functionality is also available via the DataFramesMeta package which provides a macro-based framework to interface with data frames,
    # such as via the @linq macro and the |> operator.
    # Consult the documentation for further information.

    # by(data, :Grade, :Price => x -> ( NumSold = length(x), AvgPrice = mean(x)) )
    # combine(groupby(data, :Grade), :Price => x -> (NumSold = length(x), AvgPrice = mean(x)))
    return combine(groupby(data, :Grade), :Price => x -> (length(x), mean(x)))
    end

function main_dataframe_ops()
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    summary = summarize_purchaseData(df)

    println(first(sort(data, :Date), 3), "\n")
    println(first(filter(row -> row[:Price] > 50000, data), 3), "\n")
    println(first(data, 3), "\n")
    println(summary)
end

function main_l0409_dataframeOperations()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    data = select_non_missing(data)
    data = cast_string_to_Date(data)
    data = sort_on_date_ascending(data)
    println(first(data, 3))
    data = select_Price_greater_than_50000(data)
    println(first(data,3 ))
    data = cast_grade_to_categorical(data)
    println(first(data, 3))
    data = summarize_purchaseData(data)
    println( data )
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0409_dataframeOperations()
end



export select_non_missing
export cast_string_to_Date
export sort_on_date_ascending
export select_Price_greater_than_50000
export cast_grade_to_categorical
export summarize_purchaseData

