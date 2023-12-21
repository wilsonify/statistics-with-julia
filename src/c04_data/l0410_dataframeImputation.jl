# Cleaning and imputing data
#=
In lines 4–5,
we check if there are any rows with missing values in both the :Grade and :Price columns,
and we remove them if present.
First ismissing() is applied element-wise over all values in each column,
.& is then used to evaluate to true if both columns contain missing,
and finally the preceding .! is used to ﬂip the result,
evaluating to true if the row should be kept.
In our example, there are no rows with missing values in both columns, so all rows are kept.
In lines 7–8, we replace all missing names with the strings "QQ" and "31/06/2008",
respectively, via replace!().
In lines 10–11, dropmissing() and by() are used to calculate the mean price of each group,
excluding rows with missing values.
The results are rounded to the nearest thousand (digits = -3) and stored as the data frame grPr.
In line 14, the dictionary d is created based on the values from grPr,
with grade the key,
and average price the value.
In line 14,
the nearIndx() function is created.
It takes a value as input, x,
and then finds the index of the nearest value from a given vector of values, v.
In lines 15–22,
we loop over each row in the data frame and impute missing values in the price and grade columns.
In lines 16–18,
if the price entry is missing,
then the grade is used to return the corresponding value stored in the dictionary d.
Similarly, in lines 19–21,
if the grade entry is missing,
then the nearIndx() function is used to find the index of the closest value
in grPr based on the price in data, and then missing is replaced by the corresponding grade.
In lines 24–25, the first several rows of the data frame are printed,
along with a summary of the cleaned data frame.
At this point, no missing values are present.
=#
using DataFrames, CSV, Statistics
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/purchaseData.csv", DataFrame)

rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
data = data[rowsKeep, :]

replace!(x -> ismissing(x) ? "QQ" : x, data.Name)
replace!(x -> ismissing(x) ? "31/06/2008" : x, data.Date)

# by function was removed from DataFrames.jl.
# Use `combine(groupby(), )` or `combine(f, groupby())` instead.
# grPr = by(dropmissing(data), :Grade, :Price=>x -> AvgPrice = round(mean(x), digits=-3))
grPr = combine(groupby(dropmissing(data), :Grade), :Price => x -> round(mean(x), digits = -3))

d = Dict(grPr[:, 1] .=> grPr[:, 2])
nearIndx(v, x) = findmin(abs.(v.-x))[2]
for i in 1:nrow(data)
    if ismissing(data[i, :Price]) 
        data[i, :Price] = d[data[i, :Grade]]
    end
    if ismissing(data[i, :Grade])
        data[i, :Grade] = grPr[ nearIndx(grPr[:, 2], data[i, :Price]), :Grade]
    end   
end

println(first(data, 5), "\n")
println(describe(data))

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
