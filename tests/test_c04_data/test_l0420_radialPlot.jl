using DataFrames, CSV, Dates, StatsBase, Plots, TimeSeries

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

using Test
# Define a test for data reading
@testset "Data Reading Test" begin
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols=true)

    # Check if the data is not empty
    @test !isempty(data)

    # Check if specific columns exist in the DataFrame (adjust as needed)
    @test hasproperty(data, :Brisbane)
    @test hasproperty(data, :Year)
    @test hasproperty(data, :Month)
    @test hasproperty(data, :Day)
end

# Define a test for date conversion
@testset "Date Conversion Test" begin
    data = DataFrame(
        Year=[2022, 2022],
        Month=[7, 8],
        Day=[1, 15]
    )

    dates = [
        Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i in 1:nrow(data)
    ]

    # Check if the date conversion produces the expected dates
    @test dates == [Date(2022, 7, 1), Date(2022, 8, 15)]
end

# Define a test for data processing
@testset "Data Processing Test" begin
    data = DataFrame(
        Brisbane=[25.0, 28.0, 30.0],
        Year=[2022, 2022, 2022],
        Month=[7, 8, 9],
        Day=[1, 15, 30]
    )

    window1, window2 = 7, 14
    d1 = values(moving(mean, TimeArray(data.Day, data.Brisbane), window1))
    d2 = values(moving(mean, TimeArray(data.Day, data.Brisbane), window2))


    @test typeof(d1) == 100
    @test typeof(d2) == 100
end


function main()
    data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols=true)
    brisbane = data.Brisbane
    dates = [Date(Year(data.Year[i]), Month(data.Month[i]), Day(data.Day[i])) for i = 1:nrow(data)]
    window1, window2 = 7, 14
    d1 = values(moving(mean, TimeArray(dates, brisbane), window1))
    d2 = values(moving(mean, TimeArray(dates, brisbane), window2))
    grid = (2pi:-2pi/365:0) .+ pi / 2
    monthsNames = Dates.monthname.(dates[1:31:365])
    plot(grid, d1[1:365], c=:blue, proj=:polar, label="Brisbane weekly average temp.")
    plot!(
        grid,
        d2[1:365],
        xticks=([mod.((11pi/6:-pi/6:0) .+ pi / 2, 2pi);], monthsNames),
        c=:red,
        proj=:polar,
        label="Brisbane fortnightly average temp.",
        legend=:outerbottom,
    )
end
