
function read_anscombe_from_csv(path_to_anscombeData)
    anscombe = CSV.read(path_to_anscombeData,DataFrame,copycols = true)
    return anscombe
end