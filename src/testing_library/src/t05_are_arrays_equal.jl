using Statistics, StatsBase, LinearAlgebra, DataFrames, CSV

function is_all_approx_array(arr1, arr2)
    number_of_rows = size(arr1, 1)
    number_of_cols = size(arr2, 2)
    for i in 1:number_of_rows, j in 1:number_of_cols
        approx = isapprox(arr1[i, j], arr2[i, j], atol = 0.1)
        if !approx
            return false
            end
    end
    return true
end

function is_array_equal(arr1, arr2)
    for i in 1:size(arr1, 1), j in 1:size(arr1, 2)
        if arr1[i, j] != arr2[i, j]
            return false
            end
    end
    return true
end

# Function to test if two histograms are approximately equal
function is_histogram_equal(data, expected, label)
    bins = 200
    δ = 0.1
    hist_data, edges = histogram(data, bins=bins, density=true)
    hist_expected, _ = histogram(expected, bins=bins, density=true)
    test = abs.(hist_data .- hist_expected) .< δ
    if !all(test)
        println("Histogram test failed for $label")
        return false
    end
    return true
end

export is_all_approx_array
export is_array_equal
