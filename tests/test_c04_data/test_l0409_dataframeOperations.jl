using DataFrames, CSV, Dates, Statistics, CategoricalArrays
function main()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../data")

    data =
        dropmissing(CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true))

    data[!, :Date] = Date.(data[!, :Date], "d/m/y")
    println(first(sort(data, :Date), 3), "\n")

    println(first(filter(row -> row[:Price] > 50000, data), 3), "\n")

    # categorical! function is not defined in the DataFrames package.
    # Instead, you should use the CategoricalArray constructor to convert a column to a categorical data type.

    #categorical!(data, :Grade)
    data[!, :Grade] = CategoricalArray(data[!, :Grade])

    println(first(data, 3), "\n")

    #println(   by(data, :Grade, :Price => x -> ( NumSold = length(x), AvgPrice = mean(x)) )   )
    #println( combine(groupby(data, :Grade), :Price => x -> (NumSold = length(x), AvgPrice = mean(x))) )
    println(combine(groupby(data, :Grade), :Price => x -> (length(x), mean(x))))
end
