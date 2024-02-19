# Box plots of data
using DataFrames
using CSV
using StatsPlots
using io_library: read_machine_data

function main_l0422_boxplot()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")
    # the data files for each of the machines are loaded and the data stored as separate arrays.
    data1 = read_machine_data("$path_to_data/machine1.csv")[:,1]
    data2 = read_machine_data("$path_to_data/machine2.csv")[:,1]
    data3 = read_machine_data("$path_to_data/machine3.csv")[:,1]

    # the boxplot is created via the boxplot() function from the StatsPlots package.
    boxplot([data1, data2, data3], c = [:blue :red :green], label = "",
        xticks = ([1:1:3; ],["1", "2", "3"]), xlabel = "Machine type",
        ylabel = "Pipe Diameter (mm)")
end


if abspath(PROGRAM_FILE) == @__FILE__
    main_l0422_boxplot()
end