using DataFrames, CSV

function main()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../data")

    data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    println("Original value: ", data1.Name[1], "\n")

    data2 = data1
    data2.Name[1] = "EMILY"
    @show data1.Name[1]

    data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    data2 = copy(data1)
    data2.Name[1] = "EMILY"
    @show data1.Name[1]
    println()

    data1 = DataFrame()
    data1.X = [[0, 1], [100, 101]]
    data2 = copy(data1)
    data2.X[1][1] = -1
    @show data1.X[1][1]

    data1 = DataFrame(X = [[0, 1], [100, 101]])
    data2 = deepcopy(data1)
    data2.X[1][1] = -1
    @show data1.X[1][1]
end
