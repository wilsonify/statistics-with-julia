using CSV

read_companyData(path_to_companyData) = CSV.read(path_to_companyData, DataFrame)

export read_companyData