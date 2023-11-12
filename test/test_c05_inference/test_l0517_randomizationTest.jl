using Combinatorics, Statistics, DataFrames, CSV

path_to_here = @__DIR__
include("$path_to_here/t04_dataframe_to_dict.jl")
path_to_data = abspath("$path_to_here/../../data")

read_fertilizer() = CSV.read("$path_to_data/fertilizer.csv", DataFrame)

function compute_pval(data)
control = data.Control
fertilizer = data.FertilizerX
subGroups = collect(combinations([control; fertilizer],10))
meanFert = mean(fertilizer)
p_value = sum([mean(i) >= meanFert for i in subGroups]) / length(subGroups)
return p_value
end

using Test

@testset "read_fertilizer" begin
data = read_fertilizer()
expected_data = Dict(
 :Control => [4.17, 5.58, 5.18],
 :FertilizerX => [6.31, 5.12, 5.54]
)
@test dataframe_to_dict(first(data,3)) == expected_data
end

@testset "end_to_end" begin
data = read_fertilizer()
pVal = compute_pval(data)
pVal = round(pVal,digits=2)
@test pVal==0.02
end