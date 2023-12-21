# Two different bar plots
#=
In line 5,
reshape() is used to reshape the market capitalization data from a single column to a 5 × 3
array,
with the rows representing years and columns companies.
In lines 7–11,
the groupedbar() function from StatsPlots is used to create the bar plots.
By setting bar_position=:stack, a stackplot is created,
while bar_position=:dodge creates a grouped bar plot instead.
=#
using DataFrames, CSV, CategoricalArrays, StatsPlots
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

df = CSV.read("$path_to_data/companyData.csv", DataFrame)
years = levels(df.Year)
data = reshape(df.MarketCap, 5, 3)

p1 = groupedbar(years, data, bar_position = :stack)
p2 = groupedbar(years, data, bar_position = :dodge)
plot(p1, p2, bar_width = 0.7, fill = [:blue :red :green], label = ["A" "B" "C"],
    ylims = (0,6), xlabel = "Year", ylabel = "Market Cap (MM)",
    legend = :topleft, size = (800,400))


using DataFrames, CSV, CategoricalArrays, StatsPlots
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
read_companyData() = CSV.read("$path_to_data/companyData.csv", DataFrame)

using Test
@testset "" begin
    df = read_companyData()
    years = levels(df.Year)
    data = reshape(df.MarketCap, 5, 3)
    p1 = groupedbar(years, data, bar_position = :stack)
    p2 = groupedbar(years, data, bar_position = :dodge)
    plot(p1,
        p2,
        bar_width = 0.7,
        fill = [:blue :red :green],
        label = ["A" "B" "C"],
        ylims = (0, 6),
        xlabel = "Year",
        ylabel = "Market Cap (MM)",
        legend = :topleft,
        size = (800, 400))
end
