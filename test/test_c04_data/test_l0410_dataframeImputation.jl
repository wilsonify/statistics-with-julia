using DataFrames, CSV, Statistics
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame)

function preprocess_purchaseData(data)
    rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
    data = data[rowsKeep, :]
    replace!(x -> ismissing(x) ? "QQ" : x, data.Name)
    replace!(x -> ismissing(x) ? "31/06/2008" : x, data.Date)
    return data
end

function summarize_purchaseData(data)
    # by function was removed from DataFrames.jl.
    # Use `combine(groupby(), )` or `combine(f, groupby())` instead.
    # grPr = by(dropmissing(data), :Grade, :Price=>x -> AvgPrice = round(mean(x), digits=-3))
    grPr = combine(groupby(dropmissing(data), :Grade), :Price => x -> round(mean(x), digits = -3))
    return grPr
end

function enrich_data_with_summary(data)
    grPr = summarize_purchaseData(data)
    d = Dict(grPr[:, 1] .=> grPr[:, 2])
    nearIndx(v, x) = findmin(abs.(v .- x))[2]
    for i in 1:nrow(data)
        if ismissing(data[i, :Price])
            data[i, :Price] = d[data[i, :Grade]]
        end
        if ismissing(data[i, :Grade])
            data[i, :Grade] = grPr[nearIndx(grPr[:, 2], data[i, :Price]), :Grade]
        end
    end
    return data
end

using Test, Random
@testset "preprocess_purchaseData test" begin
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "B", "E", missing, "C"],
        :Price => [79700, missing, 24311, 38904, 47052],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA"]))
    @test are_dataframes_equal(first(df, 5), expected_data)
end

@testset "summarize_purchaseData test" begin
    Random.seed!(0)
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    grouped_df = summarize_purchaseData(df)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "E", "C", "D", "B"],
        :Price_function => [76000.0, 21000.0, 45000.0, 35000.0, 60000.0]))
    @test dataframe_to_dict(first(grouped_df, 5)) == dataframe_to_dict(expected_data)
end

@testset "enrich_data_with_summary test" begin
    Random.seed!(0)
    df = read_purchaseData()
    df = preprocess_purchaseData(df)
    df = enrich_data_with_summary(df)
    expected_data = DataFrame(Dict{Symbol, Array{Any, 1}}(:Grade => ["A", "B", "E", "D", "C"],
        :Price => [79700, 60000, 24311, 38904, 47052],
        :Date => ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008"],
        :Name => ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA"]))
    @test dataframe_to_dict(first(df, 5)) == dataframe_to_dict(expected_data)
end
