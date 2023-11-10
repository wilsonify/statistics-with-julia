using DataFrames, CSV, CategoricalArrays, Plots; pyplot()
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

df = CSV.read("$path_to_data/companyData.csv", DataFrame)
mktCap = reshape(df.MarketCap, 5, 3)
years = levels(df.Year)

areaplot(years, mktCap, 
    c = [:blue :red :green], labels = ["A" "B" "C"],
    xlims = (minimum(years),maximum(years)), ylims = (0,6.5),
    legend = :topleft, xlabel = "Years", ylabel = "MarketCap")