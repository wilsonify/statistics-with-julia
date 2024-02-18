
using DataFrames
using CSV

function read_purchaseData_immutable(path_to_purchaseData)
    # has immutable columns
    return CSV.read(path_to_purchaseData, DataFrame)
end

function read_purchaseData_mutable(path_to_purchaseData)
    # has mutable columns
    return CSV.read(path_to_purchaseData, DataFrame, copycols = true)
end

function read_purchaseData(path_to_purchaseData)
    df = read_purchaseData_mutable(path_to_purchaseData)
    return df
end

export read_purchaseData
export read_purchaseData_mutable
export read_purchaseData_immutable
