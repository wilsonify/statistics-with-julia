#=
Conﬁdence interval for a proportion
=#
using CSV
using DataFrames
using CategoricalArrays # levels()
using DataFrames
using Distributions

function sum_of_missing(arr)
    is_missing  = ismissing.(arr)
    result = sum(.!(is_missing))
    return result
    end


function main_l0607_proportionCI()
    # load the data
    data = CSV.read("$(@__DIR__)/../../../data/purchaseData.csv", DataFrame, copycols = true)
    # describe the the Grade column.
    println("Data points: ", nrow(data))
    # Note the use of CategoricalArrays.levels() from .
    println("Levels of Grade: ", levels(data.Grade))
    # handle missing values.
    # broadcast ismissing()
    Grade_ismissing = ismissing.(data.Grade)
    # broadcast negation
    Grade_notmissing = .!(Grade_ismissing)
    # the number of (non-missing) observations, n.
    n = sum(Grade_notmissing)
    println("Non-missing data points: ", n)
    # construct a dataframe with a single column after dropmissing() is applied with :Grade as a second argument.
    data2 = dropmissing(data[:,[:Grade]],:Grade)

    # carry out proportion estimation for "E".
    gradeInQuestion = "E"
    # creates I1 , . . . , In .
    indicatorVector = data2.Grade .== gradeInQuestion
    numSuccess = sum(indicatorVector)
    # calculate p̂ and
    phat = numSuccess/n
    # calculate standard error
    serr = sqrt(phat*(1-phat)/n)
    # determine the conﬁdence interval
    alpha = 0.05
    confidencePercent = 100*(1-alpha)
    zVal = quantile(Normal(),1-alpha/2)
    confInt = (phat - zVal*serr, phat + zVal*serr)
    # print the results.
    println("Out of $n non-missing observations, $numSuccess are at level $gradeInQuestion.")
    println("Hence a point estimate for the proportion of grades at level $gradeInQuestion is $phat.")
    println("A $confidencePercent% confidence interval for the proprotion of level $gradeInQuestion is: $confInt.")
end
