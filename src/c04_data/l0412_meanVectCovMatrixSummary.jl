using DataFrames, CSV, Statistics
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data = CSV.read("$path_to_data/temperatures.csv", DataFrame, copycols = true)
brisT = data.Brisbane
gcT = data.GoldCoast

sigB = std(brisT)
sigG = std(gcT)
covBG = cov(brisT, gcT)

meanVect = [mean(brisT) , mean(gcT)]
covMat = [sigB^2  covBG
          covBG   sigG^2]

outfile = open("../../data/mvParams.jl","w")
write(outfile,"meanVect = $meanVect \ncovMat = $covMat")
close(outfile)
print(read("$path_to_data/mvParams.jl", String))