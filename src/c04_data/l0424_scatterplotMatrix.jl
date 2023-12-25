# Scatter Plot Matrix
#=
In line 3,
we create the data frame and,
in line 4,
we print the number of rows in it.
In lines 6–9,
we define a function that takes a string, name,
that is assumed to be of the form "SepalWidth" as an example.
Such are the names of columns in the iris dataset.
The function then inserts white space prior to the last
capital letter so as to convert the string to "Sepal Width".
Notice the use of string concatenation using * in line 8.
We then use this function in line 11 to create featureNames,
an array of strings that is later used to label the variables.
Note the use of names() in line 11, yielding an array of symbols.
Lines 14–16 deal with the species and their frequency.
The names of species are obtained in line 14 and their frequency is obtained in line 15.
This is simply for purposes of summarizing these results in the output generated in line 16.
In line 18,
we use the default() function from Plots to set parameters used by all scatter plots.
In line 20, we create a matrix of scatter plots.
Note the use of group= in line 21 based on species.
Also note the condition in line 22 for presenting a legend only in the top left plot.
The plots are then presented in a figure in line 25.
=#
using RDatasets, Measures, Plots; gr()
function main_l0424_scatterplotMatrix()
    data = dataset("datasets", "iris")
    println("Number of rows: ", nrow(data))

    insertSpace(name) = begin
        i = findlast(isuppercase,name)
        name[1:i - 1] * " "*name[i:end]
    end

    featureNames = insertSpace.(string.(names(data)))[1:4]
    println("Names of features:\n\t", featureNames)

    speciesNames = unique(data.Species)
    speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
    println("Frequency per species:\n\t", speciesFreqs)

    default(msw = 0, ms = 3)

    scatters = [
        scatter(data[:,i], data[:,j], c=[:blue :red :green], group=data.Species,
            xlabel=featureNames[i], ylabel=featureNames[j], legend = i==1 && j==1)
        for i in 1:4, j in 1:4 ]

    plot(scatters..., size=(1200,800), margin = 4mm)
end

using RDatasets, Measures, Plots; gr()

read_iris_data() = dataset("datasets", "iris")

function insertSpace(name)
    i = findlast(isuppercase, name)
    name[1:(i - 1)] * " " * name[i:end]
    return name
end
@testset "read_iris_data test" begin
    data = read_iris_data()
    @test nrow(data) == 150
end
@testset "speciesNames test" begin
    data = read_iris_data()
    speciesNames = unique(data.Species)
    @test speciesNames == ["setosa", "versicolor", "virginica"]
end
@testset "speciesFreqs test" begin
    data = read_iris_data()
    speciesNames = unique(data.Species)
    speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
    @test speciesFreqs == ["setosa" => 50, "versicolor" => 50, "virginica" => 50]
end

@testset "scatterplot matrix test" begin
    data = read_iris_data()
    @test nrow(data) == 150
    featureNames = insertSpace.(string.(names(data)))[1:4]
    println("Names of features:\n\t", featureNames)
    speciesNames = unique(data.Species)
    speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
    println("Frequency per species:\n\t", speciesFreqs)
    default(msw = 0, ms = 3)
    scatters = [scatter(data[:, i],
        data[:, j],
        c = [:blue :red :green],
        group = data.Species,
        xlabel = featureNames[i],
        ylabel = featureNames[j],
        legend = i == 1 && j == 1) for i in 1:4, j in 1:4]
    plot(scatters..., size = (1200, 800), margin = 4mm)
end
