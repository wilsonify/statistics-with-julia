# Creating and inspecting a DataFrame
using DataFrames, CSV
function main()
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../data")
print("path_to_data=$path_to_data")
data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

println(size(data),"\n")
println(names(data),"\n")
println(first(data, 6),"\n")
println(describe(data),"\n")
end