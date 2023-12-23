# Handling missing entries
using Statistics
using DataFrames
using CSV

function read_purchaseData(path_to_purchaseData)
    # copycols = true will use mutable columns
    return CSV.read(path_to_purchaseData, DataFrame, copycols = true)
end

function calculate_mean_price_no_missing(data)
    # calculate the mean of the :Price column
    # however missing is returned as this column contains missing values.
    return mean(data.Price)
end

function calculate_nanmean_price(data)
    # skipmissing() returns a copy of the data which has no missing entries,
    return mean(skipmissing(data.Price))
end

function replace_all_missing_grades(data)
    # data.Grade is used to obtain a reference to the :Grade column,
    # and then the coalesce() function is used to replace all missing values with the string “QQ”.
    data.Grade = coalesce.(data.Grade, "QQ")
    return data
end

function dropmissing_price(data)
    # dropmissing() is used to drop all rows which have missing in the :Price column.
    # If no second argument is given, dropmissing() will drop all rows that contain missing.
    dropmissing(data,:Price)
    return data
end

function sum_is_missing_name(data)
    # ismissing() is used with the broadcast operator to check
    # if values in the :Name column are missing.
    # If they are, true is returned, else false.
    # Then sum() is used to calculate how many missing entries are present.
    return sum(ismissing.(data.Name))
    end

function findall_complete(data)
    # check if each row contains fully completed fields, i.e. no missing values.
    # for each row, If no missing values are present, then true else false,
    # findall() returns an array of row indexes which have no missing values
    return findall(completecases(data))
end

function main_l0407_dataframeMissing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = read_purchaseData("$path_to_data/purchaseData.csv")
    println(calculate_mean_price_no_missing(data))
    println(calculate_nanmean_price(data))
    println(sum_is_missing_name(data))
    println(replace_all_missing_grades(data).Grade[1:4])
    println(first(dropmissing_price(data), 4))
    println(findall_complete(data)[1:4])
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0407_dataframeMissing()
end

export calculate_mean_price_no_missing
export calculate_nanmean_price
export sum_is_missing_name
export replace_all_missing_grades
export dropmissing_price
export findall_complete

