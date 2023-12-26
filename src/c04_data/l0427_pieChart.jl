# Pie Chart

using DataFrames
using CSV
using CategoricalArrays
using Plots; gr()
using .IOLibrary: read_companyData

function main_l0427_pieChart()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    df = read_companyData("$path_to_data/companyData.csv")

    # levels() from the CategoricalArrays package is used to extract the name of each company as a level,
    # and store them in the array companies.
    companies = levels(df.Type)

    # the market capitalization for each company is stored
    # as arrays year2012 and year2016 for the years 2012 and 2016, respectively.
    year2012 = df[df.Year .== 2012, :MarketCap]
    year2016 = df[df.Year .== 2016, :MarketCap]

    # the pie() function is used to create the pie charts.
    p1 = pie(companies, year2012, title = "2012 Market Cap \n by company")
    p2 = pie(companies, year2016, title = "2016 Market Cap \n by company")
    plot(p1, p2, size = (800, 400))
end
