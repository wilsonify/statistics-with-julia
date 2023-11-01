using RDatasets, StatsPlots
function main()
iris = dataset("datasets", "iris")
@df iris violin(:Species, :SepalLength, 
    fill = :blue, xlabel = "Species", ylabel = "Sepal Length", legend = false)

end