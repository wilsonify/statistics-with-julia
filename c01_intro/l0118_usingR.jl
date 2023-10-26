# Using R from Julia
using CSV, DataFrames, RCall

path_to_here = @__DIR__
path_to_there = abspath("$path_to_here/../data")
data1 = CSV.read("$path_to_there/machine1.csv", DataFrame , header = false)[:,1]
data2 = CSV.read("$path_to_there/machine2.csv", DataFrame, header = false)[:,1]
data3 = CSV.read("$path_to_there/machine3.csv", DataFrame, header = false)[:,1]

function R_ANOVA(allData)

    data = vcat([ [x fill(i, length(x))] for (i, x) in
                enumerate(allData) ]...)
    df = DataFrame(data, [:Diameter, :MachNo])
    @rput df

    R"""
    df$MachNo <- as.factor(df$MachNo)
    anova <- summary(aov( Diameter ~ MachNo, data=df))
    fVal <- anova[[1]]["F value"][[1]][1]
    pVal <- anova[[1]]["Pr(>F)"][[1]][1]
    """
    println("R ANOVA f-value: ", @rget fVal)
    println("R ANOVA p-value: ", @rget pVal)
end

R_ANOVA([data1, data2, data3])