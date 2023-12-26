using CSV

read_temperatures(path_to_temperatures) = CSV.read(path_to_temperatures, DataFrame, copycols = true)

function read_temperatures_subset(path_to_temperatures)
    # first 4 columns only
    # This happends to be an array of Float64.
    return CSV.read(path_to_temperatures, DataFrame)[:, 4]
end