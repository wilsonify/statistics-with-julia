using CSV, PyPlot, DataFrames
path_to_here=@__DIR__
path_to_data = abspath("$path_to_here/../data")
data1 = CSV.read("$path_to_data/machine1.csv", DataFrame,header=false)[:,1]
data2 = CSV.read("$path_to_data/machine2.csv", DataFrame,header=false)[:,1]
data3 = CSV.read("$path_to_data/machine3.csv", DataFrame,header=false)[:,1]

boxplot([data1,data2,data3])
xlabel("Machine type")
ylabel("Bolt Diameter (mm)")
println("n1 = ",length(data1),",\tn2 = ",length(data2), ",\tn3 = ",length(data3))
