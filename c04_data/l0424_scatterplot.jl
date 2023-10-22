using DataFrames, CSV, Plots; pyplot()
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../data")

df = CSV.read("$path_to_data/companyData.csv", DataFrame)
dividends = reshape(df[:Dividend], (5,:))
stkPrice  = reshape(df[:StockPrice], (5,:))

plot(dividends, stkPrice, 
	color=[:blue :red :green], xlims=(0,10), ylims=(0,10), 
	label=levels(df[:Type]), legend=:topleft, 
	xlabel="Dividend (%)", ylabel="StockPrice (\$)")
