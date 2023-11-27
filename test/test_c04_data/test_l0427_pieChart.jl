using DataFrames, CSV, CategoricalArrays, Plots; gr()
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_comanyData() = CSV.read("$path_to_data/companyData.csv", DataFrame)

using Test
@testset "pie plot test" begin
    df = read_comanyData()
    companies = levels(df.Type)
    year2012 = df[df.Year .== 2012, :MarketCap]
    year2016 = df[df.Year .== 2016, :MarketCap]
    p1 = pie(companies, year2012, title = "2012 Market Cap \n by company")
    p2 = pie(companies, year2016, title = "2016 Market Cap \n by company")
    plot(p1, p2, size = (800, 400))
end
