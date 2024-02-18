using CSV

function read_mass_cpus_from_csv(path_to_mass_cpusData)
    mass_cpus = CSV.read(path_to_mass_cpusData,DataFrame,copycols = true)
    return mass_cpus
end

export read_mass_cpus_from_csv