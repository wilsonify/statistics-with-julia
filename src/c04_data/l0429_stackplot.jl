# Stacked Line Plot

using DataFrames
using CSV
using CategoricalArrays
using Plots; gr()
include("$(@__DIR__)/../io_library/read_companyData.jl")

function main_l0429_stackplot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    df = read_companyData("$path_to_data/companyData.csv")

    # the data in the MarketCap column is reshaped into a 5×3 array via the reshape() function.
    mktCap = reshape(df.MarketCap, 5, 3)

    # levels() is used to store the unique years of the dataset in the array years in ascending order.
    years = levels(df.Year)

    # areaplot() is used to create the plot,
    # with the horizontal values given as the first argument,
    # and the data to be plotted as the second argument,
    # with rows treated as individual years.
    areaplot(years, mktCap,
        c = [:blue :red :green], labels = ["A" "B" "C"],
        xlims = (minimum(years),maximum(years)), ylims = (0,6.5),
        legend = :topleft, xlabel = "Years", ylabel = "MarketCap")

end

using DataFrames
using CSV
using CategoricalArrays
using Plots; gr();
using Test
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

@testset "stackplot test" begin
    df = read_companyData("$path_to_data/companyData.csv")
    @test nrow(df) == 15
end

@testset "year levels test" begin
    df = read_companyData("$path_to_data/companyData.csv")
    years = levels(df.Year)
    @test years == [2012, 2013, 2014, 2015, 2016]
end

@testset "mktCap test" begin
    df = read_companyData("$path_to_data/companyData.csv")
    mktCap = reshape(df.MarketCap, 5, 3)
    @test length(mktCap)==15
end

@testset "stackplot test" begin
    df = read_companyData("$path_to_data/companyData.csv")
    mktCap = reshape(df.MarketCap, 5, 3)
    years = levels(df.Year)
    areaplot(years,
        mktCap,
        c = [:blue :red :green],
        labels = ["A" "B" "C"],
        xlims = (minimum(years), maximum(years)),
        ylims = (0, 6.5),
        legend = :topleft,
        xlabel = "Years",
        ylabel = "MarketCap")
end
