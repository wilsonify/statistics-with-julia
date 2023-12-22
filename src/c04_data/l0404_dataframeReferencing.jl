# Referencing data in a DataFrame
using DataFrames, CSV

function get_grade1(data)
    # the rows and columns to be extracted are designated by the first and second arguments
    return data[1, 3]
    end

function get_grade2(data)
    return data[1, :Grade]
    end

function get_grade3(data)
    return data.Grade[1]
    end

function get_purchases(data)
    # : can be used to select all
    return data[[1, 2, 4], :]
    end

function get_names1(data)
    # a unit range is used to select rows 13–15,
    # the symbol :Name is used so that only the Name column is extracted.
    return data[13:15, :Name]
    end

function get_names2(data)
    # the column selected first
    # creates an array,
    return data.Name[13:15]
    end

function get_names3(data)
    # the extra set of [] creates a data frame object
    return data[13:15, [:Name]]
    end

function main_l0404_dataframeReferencing()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    # different ways of accessing the element from the first row and third column labeled :Date.
    println("Grade of person 1: ", get_grade1(data))
    println("Grade of person 1: ", get_grade2(data))
    println("Grade of person 1: ", get_grade3(data))
    println("Purchases of persons 1,2,4", get_purchases(data))
    println("Names:", get_names1(data))
    println("Names:", get_names2(data))
    println("Names:", get_names3(data))
end

if abspath(PROGRAM_FILE) == @__FILE__
    using StatisticsWithJulia: read_purchaseData
    main_l0404_dataframeReferencing()
end

export get_grade1
export get_grade2
export get_grade3
export get_names1
export get_names2
export get_names3

