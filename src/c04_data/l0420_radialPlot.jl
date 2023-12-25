# Radial plot
#=
Lines 3–9 are similar to the previous listing setting up brisbane as an array of temperature readings
and dates as an array of dates.
In line 11,
we define window1 and window2
which specify the width of the moving average smoothing to be performed.
Then lines 12–13
use several functions from the TimeSeries package to perform moving average smoothing.
We first create TimeArray objects, we then use the moving() function with first argument mean,
we then extract the values using the values() function.
The results are in the arrays d1 and d2.
In line 15, we specify the polar plotting grid.
Note the use of .+ pi/2 shifting the range by 90 degrees.
In line 16, we use the monthname() function from
package Dates to get an array of month names for labels.
The radial plots are generated in lines 18–23 using the argument proj=:polar.
Notice the specification of xticks in line 21 where we broadcast the mod()
function with second argument 2pi.
This ensures all angles are standardized to lie in the interval [0, 2π].
=#
using DataFrames, CSV, Dates, StatsBase, TimeSeries, Plots; gr()
function main_l0420_radialPlot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    data = CSV.read("$path_to_data/temperatures.csv",DataFrame, copycols = true)
    brisbane = data.Brisbane
    dates = [Date(
                Year(data.Year[i]),
                Month(data.Month[i]),
                Day(data.Day[i])
            ) for i in 1:nrow(data)]

    window1, window2 = 7, 14
    d1 = values(moving(mean,TimeArray(dates,brisbane),window1))
    d2 = values(moving(mean,TimeArray(dates,brisbane),window2))

    grid = (2pi:-2pi / 365:0) .+ pi / 2
    monthsNames = Dates.monthname.(dates[1:31:365])

    plot(grid, d1[1:365],
        c = :blue, proj = :polar, label = "Brisbane weekly average temp.")
    plot!(grid, d2[1:365],
        xticks = ([mod.((11pi / 6:-pi / 6:0) .+ pi / 2,2pi) ; ], monthsNames),
        c = :red, proj = :polar,
        label = "Brisbane fortnightly average temp.", legend = :outerbottom)

end

using DataFrames, CSV, Dates, StatsBase, TimeSeries, Plots; gr()

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

using Test
# Define a test for data reading
@testset "Data Reading Test" begin
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols = true)
    @test !isempty(data) # Check if the data is not empty
    @test hasproperty(data, :Brisbane)
    @test hasproperty(data, :Year)
    @test hasproperty(data, :Month)
    @test hasproperty(data, :Day)
end


@testset "Date Conversion Test" begin
    data = DataFrame(Year = [2022, 2022], Month = [7, 8], Day = [1, 15])
    dates = [Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i in 1:nrow(data)]
    # Check if the date conversion produces the expected dates
    @test dates == [Date(2022, 7, 1), Date(2022, 8, 15)]
end

@testset "construct with NamedTuple" begin
    data = (
    datetime=[ DateTime(2018, 11, 21, 12, 0), DateTime(2018, 11, 21, 13, 0)],
     col1=[10.2, 11.2],
     col2=[20.2, 21.2],
     col3=[30.2, 31.2]
     )
    ta = TimeArray(data; timestamp=:datetime, meta="Example")
    @test size(ta) == (2, 3)
    @test colnames(ta) == [:col1, :col2, :col3]
    @test timestamp(ta) == [DateTime(2018, 11, 21, 12, 0), DateTime(2018, 11, 21, 13, 0)]
    @test values(ta) == [10.2 20.2 30.2; 11.2 21.2 31.2]
    @test meta(ta) == "Example"
end

@testset "construct with StepRange{Date,Day}" begin
    dateRange = Date(2000,1,1):Day(1):Date(2000,1,5)
    ta = TimeArray(dateRange, 1:5)
    @test timestamp(ta)[1]   == first(dateRange)
    @test timestamp(ta)[end] == last(dateRange)
    @test values(ta)[1]   == 1
    @test values(ta)[end] == 5
end

@testset "Data Processing Test" begin
    data = DataFrame(
        Brisbane = [25.0, 28.0, 30.0],
        Year = [2022, 2022, 2022],
        Month = [7, 8, 9],
        Day = [1, 15, 30]
    )
    dates = [Date(row.Year, row.Month, row.Day) for row in eachrow(data)]


    Brisbane_TimeArray = TimeArray(dates, data.Brisbane)

    window1= 2
    d1 = values(moving(mean, TimeArray(dates, data.Brisbane), window1))
    @test length(d1) == 2
    @test typeof(d1) == Vector{Float64}

    window2 = 4
    d2 = values(moving(mean, TimeArray(dates, data.Brisbane), window2))
    @test length(d2) == 0
    @test typeof(d2) == Vector{Float64}
end

function main_radial_plots()
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols = true)
    brisbane = data.Brisbane
    dates = [Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i in 1:nrow(data)]
    window1, window2 = 7, 14
    d1 = values(moving(mean, TimeArray(dates, brisbane), window1))
    d2 = values(moving(mean, TimeArray(dates, brisbane), window2))
    grid = ((2pi):(-2pi / 365):0) .+ pi / 2
    monthsNames = Dates.monthname.(dates[1:31:365])
    plot(grid, d1[1:365], c = :blue, proj = :polar, label = "Brisbane weekly average temp.")
    plot!(grid,
        d2[1:365],
        xticks = ([mod.(((11pi / 6):(-pi / 6):0) .+ pi / 2, 2pi);], monthsNames),
        c = :red,
        proj = :polar,
        label = "Brisbane fortnightly average temp.",
        legend = :outerbottom)
end
