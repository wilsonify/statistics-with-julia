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


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0419_multipleSimplePlot()
end