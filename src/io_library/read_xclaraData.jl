using CSV

function read_xclara_from_csv(path_to_xclaraData)
    xclara = CSV.read(path_to_xclaraData,DataFrame,copycols = true)
    return xclara
end