using Statistics, StatsBase, LinearAlgebra, DataFrames, CSV

function is_all_approx_array(arr1,arr2)
    number_of_rows = size(arr1, 1)
    number_of_cols = size(arr2, 2)
    for i in 1:number_of_rows, j in 1:number_of_cols
        approx = isapprox(arr1[i, j], arr2[i, j], atol = 0.01)
        if !approx
            return false
            end
    end
    return true
end

function is_array_equal(arr1,arr2)
    for i in 1:size(arr1, 1), j in 1:size(arr1, 2)
        if arr1[i, j] != arr2[i, j]
            return false
            end
    end
    return true
end
