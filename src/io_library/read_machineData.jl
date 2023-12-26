using CSV

read_machine_data(path) = CSV.read(path, DataFrame, header = false)