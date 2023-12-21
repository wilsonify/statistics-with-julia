using RDatasets, StatsPlots

iris = dataset("datasets", "iris")
@df iris violin(:Species, :SepalLength, 
    fill = :blue, xlabel = "Species", ylabel = "Sepal Length", legend = false)


using RDatasets, StatsPlots
read_iris_data() = dataset("datasets", "iris")
@testset "read_iris_data test" begin
    iris = read_iris_data()
    @df iris violin(:Species,
        :SepalLength,
        fill = :blue,
        xlabel = "Species",
        ylabel = "Sepal Length",
        legend = false)
end
