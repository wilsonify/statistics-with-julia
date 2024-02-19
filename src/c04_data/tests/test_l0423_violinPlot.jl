
using StatsPlots
using io_library: read_iris_from_csv

@testset "read_iris_data test" begin
    iris = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
    @df iris violin(:Species,
        :SepalLength,
        fill = :blue,
        xlabel = "Species",
        ylabel = "Sepal Length",
        legend = false)
end
