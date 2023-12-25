
function read_temperatures(path_to_temperatures)
    # first 4 columns only
    return CSV.read(path_to_temperatures, DataFrame)[:, 4]
end