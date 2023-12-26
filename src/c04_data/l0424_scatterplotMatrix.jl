# Scatter Plot Matrix

using Measures
using Plots; gr()
using .IOLibrary: read_iris_from_csv

function insertSpace(name)
    # we define a function that takes a string, name,
    # that is assumed to be of the form "SepalWidth" as an example.
    # Such are the names of columns in the iris dataset.
    # The function then inserts white space prior to the last
    # capital letter so as to convert the string to "Sepal Width".
    # Notice the use of string concatenation using * in line 8.

    i = findlast(isuppercase, name)
    name[1:(i - 1)] * " " * name[i:end]
    return name
end


function main_l0424_scatterplotMatrix()
    # we create the data frame
    data = read_iris_from_csv("$(@__DIR__)/../../data/iris.csv")

    # we print the number of rows in it.
    println("Number of rows: ", nrow(data))

    # use insertSpace to create featureNames,
    # an array of strings that is later used to label the variables.
    # Note the use of names() yielding an array of symbols.
    featureNames = insertSpace.(string.(names(data)))[1:4]
    println("Names of features:\n\t", featureNames)

    # deal with the species and their frequency.
    # This is simply for purposes of summarizing these results in the output generated.

    # The names of species are obtained
    speciesNames = unique(data.Species)
    # their frequency is obtained.
    speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
    println("Frequency per species:\n\t", speciesFreqs)

    # we use the default() function from Plots to set parameters used by all scatter plots.
    default(msw = 0, ms = 3)

    # we create a matrix of scatter plots.
    # Note the use of group= in line 21 based on species.
    # Also note the condition in line 22 for presenting a legend only in the top left plot.
    # The plots are then presented in a figure in line 25.
    scatters = [
        scatter(data[:,i], data[:,j], c=[:blue :red :green], group=data.Species,
            xlabel=featureNames[i], ylabel=featureNames[j], legend = i==1 && j==1)
        for i in 1:4, j in 1:4 ]

    plot(scatters..., size=(1200,800), margin = 4mm)
end
