using DataFrames, CSV, CategoricalArrays, Plots; gr()
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

df = CSV.read("$path_to_data/companyData.csv", DataFrame)
mktCap = reshape(df.MarketCap, 5, 3)
years = levels(df.Year)

areaplot(years, mktCap, 
    c = [:blue :red :green], labels = ["A" "B" "C"],
    xlims = (minimum(years),maximum(years)), ylims = (0,6.5),
    legend = :topleft, xlabel = "Years", ylabel = "MarketCap")



using DataFrames, CSV, CategoricalArrays, Plots; gr();
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_companyData() = CSV.read("$path_to_data/companyData.csv", DataFrame)

using Test
@testset "stackplot test" begin
    df = read_companyData()
    @test nrow(df) == 15
end

@testset "year levels test" begin
    df = read_companyData()
    years = levels(df.Year)
    @test years == [2012, 2013, 2014, 2015, 2016]
end

@testset "mktCap test" begin
    df = read_companyData()
    mktCap = reshape(df.MarketCap, 5, 3)
    @test length(mktCap)==15
end

@testset "stackplot test" begin
    df = read_companyData()
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
