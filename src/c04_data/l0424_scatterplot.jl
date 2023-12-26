# Scatter Plot
using DataFrames
using CSV
using Plots; gr()

include("$(@__DIR__)/../io_library/read_companyData.jl")

function main_l0424_scatterplot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    df = read_companyData("$path_to_data/companyData.csv")
    dividends = reshape(df[!, :Dividend], (5,:))
    stkPrice = reshape(df[!, :StockPrice], (5,:))

    plot(dividends, stkPrice,
        color = [:blue :red :green], xlims = (0,10), ylims = (0,10),
        label = levels(df[!, :Type]), legend = :topleft,
        xlabel = "Dividend (%)", ylabel = "StockPrice (\$)")

end

using DataFrames
using CSV
using Plots; gr();

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")


@testset "read_companyData test" begin
    df = read_companyData("$path_to_data/companyData.csv")
    dividends = reshape(df[!, :Dividend], (5, :))
    stkPrice = reshape(df[!, :StockPrice], (5, :))
    plot(dividends,
        stkPrice,
        color = [:blue :red :green],
        xlims = (0, 10),
        ylims = (0, 10),
        label = levels(df[!, :Type]),
        legend = :topleft,
        xlabel = "Dividend (%)",
        ylabel = "StockPrice (\$)")
end
