using CSV
using DataFrames

read_machine_data(path) = CSV.read(path, DataFrame, header=false)

export read_machine_data