# Radial plot

using DataFrames
using CSV
using Dates
using StatsBase
using TimeSeries
using Plots; gr()

function main_l0420_radialPlot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # are similar to the previous listing setting up brisbane as an array of temperature readings
    # and dates as an array of dates.
    data = CSV.read("$path_to_data/temperatures.csv",DataFrame, copycols = true)
    brisbane = data.Brisbane
    dates = [Date(
                Year(data.Year[i]),
                Month(data.Month[i]),
                Day(data.Day[i])
            ) for i in 1:nrow(data)]
    # we define window1 and window2
    # which specify the width of the moving average smoothing to be performed.
    window1, window2 = 7, 14
    # use several functions from the TimeSeries package to perform moving average smoothing.
    # We first create TimeArray objects, we then use the moving() function with first argument mean,
    # we then extract the values using the values() function.
    # The results are in the arrays d1 and d2.
    d1 = values(moving(mean,TimeArray(dates,brisbane),window1))
    d2 = values(moving(mean,TimeArray(dates,brisbane),window2))
    # we specify the polar plotting grid.
    # Note the use of .+ pi/2 shifting the range by 90 degrees.
    grid = (2pi:-2pi / 365:0) .+ pi / 2

    # we use the monthname() function from
    # package Dates to get an array of month names for labels.
    monthsNames = Dates.monthname.(dates[1:31:365])

    # The radial plots are generated using the argument proj=:polar.
    plot(grid, d1[1:365], c = :blue, proj = :polar, label = "Brisbane weekly average temp.")

    # Notice the specification of xticks where we broadcast the mod() function with second argument 2pi.
    # This ensures all angles are standardized to lie in the interval [0, 2π].
    plot!(grid, d2[1:365], xticks = ([mod.((11pi / 6:-pi / 6:0) .+ pi / 2,2pi) ; ], monthsNames), c = :red, proj = :polar, label = "Brisbane fortnightly average temp.", legend = :outerbottom)

end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0420_radialPlot()
end

