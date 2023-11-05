using DataFrames, CSV, Statistics
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame)

function main()
    data = read_purchaseData()
    rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
    data = data[rowsKeep, :]

    replace!(x -> ismissing(x) ? "QQ" : x, data.Name)
    replace!(x -> ismissing(x) ? "31/06/2008" : x, data.Date)

    # by function was removed from DataFrames.jl.
    # Use `combine(groupby(), )` or `combine(f, groupby())` instead.
    # grPr = by(dropmissing(data), :Grade, :Price=>x -> AvgPrice = round(mean(x), digits=-3))
    grPr = combine(
        groupby(dropmissing(data), :Grade),
        :Price => x -> round(mean(x), digits = -3),
    )

    d = Dict(grPr[:, 1] .=> grPr[:, 2])
    nearIndx(v, x) = findmin(abs.(v .- x))[2]
    for i = 1:nrow(data)
        if ismissing(data[i, :Price])
            data[i, :Price] = d[data[i, :Grade]]
        end
        if ismissing(data[i, :Grade])
            data[i, :Grade] = grPr[nearIndx(grPr[:, 2], data[i, :Price]), :Grade]
        end
    end

    println(first(data, 5), "\n")
    println(describe(data))
end
