using DataFrames, CSV, CategoricalArrays, StatsPlots; pyplot()
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
