
using Measures
using Plots; gr()
using Test
using StatisticsWithJulia.c04_data: insertSpace
using StatisticsWithJulia.IOLibrary: read_iris_from_csv

@testset "read_iris_data test" begin
    data = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
    @test nrow(data) == 150
end
@testset "speciesNames test" begin
    data = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
    speciesNames = unique(data.Species)
    @test speciesNames == ["setosa", "versicolor", "virginica"]
end
@testset "speciesFreqs test" begin
    data = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
    speciesNames = unique(data.Species)
    speciesFreqs = [sn => sum(data.Species .== sn) for sn in speciesNames]
    @test speciesFreqs == ["setosa" => 50, "versicolor" => 50, "virginica" => 50]
end

@testset "scatterplot matrix test" begin
    data = read_iris_from_csv("$(@__DIR__)/../../../data/iris.csv")
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
