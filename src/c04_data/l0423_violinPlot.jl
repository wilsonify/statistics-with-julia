# Violin Plot
#=
In line 3,
the iris dataset from the RDatasets package is loaded as a DataFrame via the dataset function.
The first argument, "datasets", is the package in RDatasets which contains the "iris" dataset,
which is the second argument.
In line 4,
the @df macro is used to plot the data from the dataframe directly,
with the first argument :Species the horizontal axis, and the second argument
:SepalLength the vertical axis.
=#

using RDatasets
using StatsPlots
functin main_l0423_violinPlot()
iris = dataset("datasets", "iris")
@df iris violin(:Species, :SepalLength, 
    fill = :blue, xlabel = "Species", ylabel = "Sepal Length", legend = false)
end

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
