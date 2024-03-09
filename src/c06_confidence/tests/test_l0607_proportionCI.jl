using Test
using CSV
using DataFrames
using CategoricalArrays
using DataFrames
using Distributions
using io_library: read_purchaseData
using c06_confidence: sum_of_missing

@testset "read_purchaseData" begin
    data = read_purchaseData("$(@__DIR__)/../../../data/purchaseData.csv")
    @test levels(data.Grade) == ["A", "B", "C", "D", "E"]
    @test nrow(data) == 200
end

@testset "sum_ismissing" begin
    data = read_purchaseData("$(@__DIR__)/../../../data/purchaseData.csv")
    n = sum_of_missing(data.Grade)
    @test n == 187
end

@testset "" begin
    gradeInQuestion = "E"
    data = read_purchaseData("$(@__DIR__)/../../../data/purchaseData.csv")
    n = sum_of_missing(data.Grade)
    data2 = dropmissing(data[:, [:Grade]],:Grade)
    indicatorVector = data2.Grade .== "E"
    numSuccess = sum(indicatorVector)
    phat = numSuccess/n
    serr = sqrt(phat*(1-phat)/n)
    @test gradeInQuestion == "E"
    @test numSuccess == 61
    @test round(phat,digits=2)==0.33
end

@testset "" begin
    gradeInQuestion = "E"
    data = read_purchaseData("$(@__DIR__)/../../../data/purchaseData.csv")
    n = sum_of_missing(data.Grade)
    data2 = dropmissing(data[:, [:Grade]],:Grade)
    indicatorVector = data2.Grade .== "E"
    numSuccess = sum(indicatorVector)
    phat = numSuccess/n
    serr = sqrt(phat*(1-phat)/n)
    alpha = 0.05
    confidencePercent = 100*(1-alpha)
    zVal = quantile(Normal(),1-alpha/2)
    confInt = (phat - zVal*serr, phat + zVal*serr)
    confInt = round.(confInt,digits=2)
    @test confInt ==  (0.26, 0.39)
end
