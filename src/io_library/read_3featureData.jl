using CSV

function read_3featureData(path_to_3featureData)
     # we read the data with header = false since there isn’t a line in the csv for the variable (or feature) names.
     return CSV.read(path_to_3featureData, DataFrame, header = false)
end
