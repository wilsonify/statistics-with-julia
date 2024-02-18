
using CSV

read_fertilizer(path_to_fertilizer_data) = CSV.read(path_to_fertilizer_data, DataFrame)

export read_fertilizer