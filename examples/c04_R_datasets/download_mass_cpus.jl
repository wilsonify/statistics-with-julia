
using RDatasets
using CSV

function save_mass_cpus_to_csv(data, path_to_csv)
    CSV.write(path_to_csv, data)
    println("saved to $path_to_csv")
end

function main_download_mass_cpus()
    data = dataset("MASS", "cpus")
    save_mass_cpus_to_csv(data,"$(@__DIR__)/../../data/mass_cpus.csv")
end

if abspath(PROGRAM_FILE) == @__FILE__
    @time main_download_mass_cpus()
end



