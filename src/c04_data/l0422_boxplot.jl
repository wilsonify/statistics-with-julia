# Box plots of data
#=
In lines 3-5,
the data files for each of the machines are loaded and the data stored as separate arrays.
In lines 7-9,
the boxplot is created via the boxplot() function from the StatsPlots package.
=#
using DataFrames, CSV, StatsPlots
function main_l0422_boxplot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")

    data1 = CSV.read("$path_to_data/machine1.csv", DataFrame, header = false)[:,1]
    data2 = CSV.read("$path_to_data/machine2.csv", DataFrame, header = false)[:,1]
    data3 = CSV.read("$path_to_data/machine3.csv", DataFrame, header = false)[:,1]

    boxplot([data1, data2, data3], c = [:blue :red :green], label = "",
        xticks = ([1:1:3; ],["1", "2", "3"]), xlabel = "Machine type",
        ylabel = "Pipe Diameter (mm)")
end

using DataFrames, CSV, StatsPlots;
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

read_machine_data(path) = CSV.read(path, DataFrame, header = false)[:, 1]

using Test
@testset "read_machine_data test" begin
    data1 = read_machine_data("$path_to_data/machine1.csv")
    data2 = read_machine_data("$path_to_data/machine2.csv")
    data3 = read_machine_data("$path_to_data/machine3.csv")
    boxplot([data1, data2, data3],
        c = [:blue :red :green],
        label = "",
        xticks = ([1:1:3;], ["1", "2", "3"]),
        xlabel = "Machine type",
        ylabel = "Pipe Diameter (mm)")
end
