using Statistics, DataFrames, CSV
function main()
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../data")
data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

println(mean(data.Price),"\n")
println(mean(skipmissing(data.Price)),"\n")
println(coalesce.(data.Grade, "QQ")[1:4],"\n")
println(first(dropmissing(data,:Price), 4),"\n")
println(sum(ismissing.(data.Name)),"\n")
println(findall(completecases(data))[1:4])
end