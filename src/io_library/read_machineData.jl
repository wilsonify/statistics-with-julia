using CSV
using DataFrame

read_machine_data(path) = CSV.read(path, DataFrame, header=false)

export read_machine_data