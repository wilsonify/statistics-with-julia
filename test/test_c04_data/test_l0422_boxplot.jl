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
