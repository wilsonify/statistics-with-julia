# Multiple simple plots for a time-series

using DataFrames
using CSV
using Statistics
using Dates
using Measures
using Plots; gr()

function main_l0419_multipleSimplePlot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # we read the data and create the arrays brisbane and goldcoast
    # describing the temperatures in these respective locations.
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame)
    brisbane = data.Brisbane
    goldcoast = data.GoldCoast
    # we create the array diff made up of temperature differences.
    diff = brisbane - goldcoast
    dates = [Date(
                Year(data.Year[i]),
                Month(data.Month[i]),
                Day(data.Day[i])
            ) for i in 1:nrow(data)]

    # we create the array dates which contains Date objects mapped to the days of temperature measurement.
    # It is constructed based on the Year, Month, and Day
    # columns of the data frame by using the respective functions from the Dates package.
    fortnightRange = 250:263
    brisFortnight = brisbane[fortnightRange]
    goldFortnight = goldcoast[fortnightRange]
    # we define a range of days spanning a fortnight, fortnightRange.
    # This is then used to splice that fortnight
    # from the temperature data into brisFortnight and goldFortnight.
    default(xlabel = "Time", ylabel = "Temperature")
    default(label = ["Brisbane" "Gold Coast"])

    # we use the default() function from Plots to set some default argument for each subplot.
    # We then create the plots, overriding the defaults in certain cases.
    p1 = plot(dates, [brisbane goldcoast], c = [:blue :red])
    p2 = plot(dates[fortnightRange], [brisFortnight goldFortnight], c = [:blue :red], m = (:dot, 5, Plots.stroke(1)))
    p3 = plot(dates, diff, c = :black, ylabel = "Temperature Difference",legend = false)
    p4 = histogram(diff, bins = -4:0.5:6, ylims = (0,140), legend = false, xlabel = "Temperature Difference", ylabel = "Frequency")
    plot(p1,p2,p3,p4, size = (800,500), margin = 5mm)
end

using DataFrames
using CSV
using Statistics
using Dates
using Measures
using Plots; gr()
using Test
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")



# Define a test for data reading
@testset "Data Reading Test" begin
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame)
    # Check if the data is not empty
    @test !isempty(data)
    # Check if specific columns exist in the DataFrame (adjust as needed)
    @test hasproperty(data, :Brisbane)
    @test hasproperty(data, :GoldCoast)
end

# Define a test for date conversion
@testset "Date Conversion Test" begin
    data = DataFrame(Year = [2022, 2022],
        Month = [7, 8],
        Day = [1, 15])

    dates = [Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i in 1:nrow(data)]

    # Check if the date conversion produces the expected dates
    @test dates == [Date(2022, 7, 1), Date(2022, 8, 15)]
end

# Define a test for data processing
@testset "Data Processing Test" begin
    data = DataFrame(Brisbane = [25.0, 28.0, 30.0],
        GoldCoast = [24.0, 26.0, 29.0])

    diff = data.Brisbane - data.GoldCoast

    # Check if the temperature difference is calculated correctly
    @test diff == [1.0, 2.0, 1.0]
end

