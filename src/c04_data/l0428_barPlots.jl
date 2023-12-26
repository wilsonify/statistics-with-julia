# Two different bar plots

using DataFrames
using CSV
using CategoricalArrays
using StatsPlots
include("$(@__DIR__)/../io_library/read_companyData.jl")

function main_l0428_barPlots()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    df = read_companyData("$path_to_data/companyData.csv")
    years = levels(df.Year)
    # reshape() is used to reshape the market capitalization data from a single column to a 5 × 3 array,
    # with the rows representing years and columns companies.
    data = reshape(df.MarketCap, 5, 3)

    # the groupedbar() function from StatsPlots is used to create the bar plots.
    # By setting bar_position=:stack, a stackplot is created,
    # while bar_position=:dodge creates a grouped bar plot instead.
    p1 = groupedbar(years, data, bar_position = :stack)
    p2 = groupedbar(years, data, bar_position = :dodge)
    plot(p1, p2, bar_width = 0.7, fill = [:blue :red :green], label = ["A" "B" "C"],
        ylims = (0,6), xlabel = "Year", ylabel = "Market Cap (MM)",
        legend = :topleft, size = (800,400))
end
