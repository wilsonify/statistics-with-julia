# Let us mention here the difference between
# the standard String type in Julia and the String7 or String15 types.
#
# The types with number suffix denote strings that have a fixed width
# (similar to CHAR(N) type provided by many data bases).
# Such strings are much faster to work with (especially if you have many of them)
# than the standard String type because their instances are not heap allocated.
#
# For this reason CSV.read by default reads in narrow string columns using these fixed-width types.

using DataFrames, CSV
using Test
using DataFrames

function are_lists_equal(list1, list2)
    # Check if the Lists have the same number elements
    if length(list1) != length(list2)
        return false
    end

    # Check if the element types of the two lists are the same
    if eltype(list1) != eltype(list2)
        return false
    end

    # Check if the values of the two lists are the same
    for (a, b) in zip(list1, list2)
        if ismissing(a) && ismissing(b)
            continue  # Both are missing, move on to the next element
        elseif a != b
            return false  # Values are not equal, and not both missing
        end
    end

    return true
end


function are_dataframes_equal(df1::DataFrame, df2::DataFrame)
    # Check if the DataFrames have the same number of rows and columns
    if size(df1) != size(df2)
        return false
    end

    # Check if the column names are the same
    if names(df1) != names(df2)
        return false
    end

    # Check if the column types are the same
    if eltype(df1) != eltype(df2)
        return false
    end

    # Check if the values of the DataFrames are the same
    for col in 1:size(df1, 2)
        for row in 1:size(df1, 1)
            if ismissing(df1[row, col]) && ismissing(df2[row, col])
                continue  # Both are missing, move on to the next element
            elseif df1[row, col] != df2[row, col]
                return false  # Values are not equal, and not both missing
            end
        end
    end

    return true
end


reference_data = DataFrame(
    Name = Union{Missing, String15}["MARYANNA", "REBECCA", "KHADIJAH"],
    Date = Union{Missing, String15}["14/09/2008", "11/03/2008", "2/09/2008"],
    Grade = Union{Missing, String15}["A", "B", missing],
    Price = Union{Int64, Missing}[79700, missing, 38904]
)

reference_names_list = Union{Missing, String15}["SAMMIE", missing, "STACEY"]

reference_names = DataFrame(
    Name=reference_names_list
)


@testset "" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test data[1, 3] == "A"
    @test data[1, :Grade] == "A"
    @test data.Grade[1] == "A"
    @test are_dataframes_equal(data[[1, 2, 4], :], reference_data)
    @test are_lists_equal(data[13:15, :Name], reference_names_list)
    @test are_lists_equal(data.Name[13:15],reference_names_list)
    @test are_dataframes_equal(data[13:15, [:Name]],reference_names)
end
