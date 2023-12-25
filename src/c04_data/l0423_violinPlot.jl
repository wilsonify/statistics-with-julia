# Violin Plot
#=
In line 3,
the iris dataset from the RDatasets package is loaded as a DataFrame via the dataset function.
see examples/c04_iris_data/downloadIrisData.jl

The first argument, "datasets", is the package in RDatasets which contains the "iris" dataset,
which is the second argument.
In line 4,
the @df macro is used to plot the data from the dataframe directly,
with the first argument :Species the horizontal axis, and the second argument
:SepalLength the vertical axis.
=#
using StatsPlots
include("$(@__DIR__)/../io_library/read_irisData.jl")

function main_l0423_violinPlot()
    iris = read_iris_from_csv("$(@__DIR__)/../data/iris.csv")
    @df iris violin(:Species, :SepalLength,
        fill = :blue, xlabel = "Species", ylabel = "Sepal Length", legend = false)
end

using StatsPlots

@testset "read_iris_data test" begin
    iris = read_iris_from_csv("$(@__DIR__)/../data/iris.csv")
    @df iris violin(:Species,
        :SepalLength,
        fill = :blue,
        xlabel = "Species",
        ylabel = "Sepal Length",
        legend = false)
end
