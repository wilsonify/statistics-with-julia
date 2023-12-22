using DataFrames

function are_dataframes_equal(df1::DataFrame, df2::DataFrame)
    # Check if the DataFrames have the same number of rows and columns
    if size(df1) != size(df2)
        println("Size $(size(df1)) != $(size(df2))")
        return false
    end

    # Check if the column names are the same
    if Set(names(df1)) != Set(names(df2))
        println("Names $(names(df1)) != $(names(df2))")
        return false
    end

    # Check if the column types are the same
    if eltype(df1) != eltype(df2)
        println("Types $(eltype(df1)) != $(eltype(df2))")
        return false
    end

    # Check if the values of the DataFrames are the same
    for col in Set(names(df1))
        for row in 1:size(df1, 1)
            if ismissing(df1[row, col]) && ismissing(df2[row, col])
                continue  # Both are missing, move on to the next element
            elseif ismissing(df1[row, col]) || ismissing(df2[row, col])
                println("row $row")
                println("col $col")
                println("one is missing")
                return false  # One is missing while the other is not
            elseif df1[row, col] != df2[row, col]
                println("row $row")
                println("col $col")
                println("value $(df1[row, col]) != $(df2[row, col])")
                return false  # Values are not equal, and not both missing
            end
        end
    end

    return true
end

function are_dataframes_approx(df1::DataFrame, df2::DataFrame, abs)
    # Check if the DataFrames have the same number of rows and columns
    if size(df1) != size(df2)
        println("Size $(size(df1)) != $(size(df2))")
        return false
    end

    # Check if the column names are the same
    if Set(names(df1)) != Set(names(df2))
        println("Names $(names(df1)) != $(names(df2))")
        return false
    end

    # Check if the column types are the same
    if eltype(df1) != eltype(df2)
        println("Types $(eltype(df1)) != $(eltype(df2))")
        return false
    end

    # Check if the values of the DataFrames are the same
    for col in Set(names(df1))
        for row in 1:size(df1, 1)
            if ismissing(df1[row, col]) && ismissing(df2[row, col])
                continue  # Both are missing, move on to the next element
            elseif ismissing(df1[row, col]) || ismissing(df2[row, col])
                println("row $row")
                println("col $col")
                println("one is missing")
                return false  # One is missing while the other is not

            elseif isapprox(df1[row, col], df2[row, col], abs = abs)
                println("row $row")
                println("col $col")
                println("value $(df1[row, col]) != $(df2[row, col])")
                return false  # Values are not equal, and not both missing
            end
        end
    end

    return true
end

export are_dataframes_equal
export are_dataframes_approx
