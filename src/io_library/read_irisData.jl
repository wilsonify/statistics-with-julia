using CSV

function read_iris_from_csv(path_to_irisData)
    iris = CSV.read(path_to_irisData,DataFrame,copycols = true)
    return iris
end