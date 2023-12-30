# Violin Plot

using StatsPlots
using .IOLibrary: read_iris_from_csv

function main_l0423_violinPlot()
    # the iris dataset from the RDatasets package is loaded as a DataFrame via the dataset function.
    # see examples/c04_iris_data/downloadIrisData.jl
    iris = read_iris_from_csv("$(@__DIR__)/../../data/iris.csv")
    # the @df macro is used to plot the data from the dataframe directly,
    # with the first argument :Species the horizontal axis, and the second argument
    # :SepalLength the vertical axis.
    @df iris violin(:Species, :SepalLength, fill = :blue, xlabel = "Species", ylabel = "Sepal Length", legend = false)
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_l0423_violinPlot()
end