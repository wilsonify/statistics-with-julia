using CSV, DataFrames, CategoricalArrays, DataFrames, Distributions
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../../data")

read_purchaseData() = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
function sum_of_missing(arr)
    is_missing  = ismissing.(arr)
    result = sum(.!(is_missing))
    return result
    end

using Test
@testset "read_purchaseData" begin
data = read_purchaseData()
@test levels(data.Grade) == ["A", "B", "C", "D", "E"]
@test nrow(data) == 200
end

@testset "sum_ismissing" begin
data = read_purchaseData()
n = sum_of_missing(data.Grade)
@test n == 187
end

@testset "" begin
data = read_purchaseData()
n = sum_of_missing(data.Grade)
data2 = dropmissing(data[:,[:Grade]],:Grade)
gradeInQuestion = "E"
indicatorVector = data2.Grade .== gradeInQuestion
numSuccess = sum(indicatorVector)
phat = numSuccess/n
serr = sqrt(phat*(1-phat)/n)
@test gradeInQuestion == "E"
@test numSuccess == 61
@test round(phat,digits=2)==0.33
end

@testset "" begin
data = read_purchaseData()
n = sum_of_missing(data.Grade)
data2 = dropmissing(data[:,[:Grade]],:Grade)
gradeInQuestion = "E"
indicatorVector = data2.Grade .== gradeInQuestion
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

