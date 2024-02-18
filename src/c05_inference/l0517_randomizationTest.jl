#=
A Randomized Hypothesis Test
=#

using Combinatorics # combinations()
using Statistics
using DataFrames
using CSV


function compute_pval(data)
    control = data.Control
    fertilizer = data.FertilizerX
    subGroups = collect(combinations([control; fertilizer],10))
    meanFert = mean(fertilizer)
    p_value = sum([mean(i) >= meanFert for i in subGroups]) / length(subGroups)
    return p_value
end


function main_l0517_randomizationTest()
    # import data for the control and fertilized groups
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    data = CSV.read("$path_to_data/fertilizer.csv", DataFrame)
    control = data.Control
    fertilizer = data.FertilizerX

    # concatenate all observations into one array
    concatenated = [control; fertilizer]

    # generate an iterator object for all combinations of 10 elements from our 20 observations.
    all_combinations = combinations(concatenated,10)

    # collect into an array
    subGroups = collect(all_combinations)

    # calculate the mean of the fertilizer group
    meanFert = mean(fertilizer)

    # calculate the mean of each combination and compared against meanFert.
    # pVal is the proportion of means which are greater than or equal to meanFert
    pVal = sum([mean(i) >= meanFert for i in subGroups]) / length(subGroups)
    println("p-value = ", pVal)
end

