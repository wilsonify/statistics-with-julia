
using RDatasets
using CSV

function save_Anscombe_to_csv(data, path_to_csv)
    CSV.write(path_to_csv, data)
    println("saved to $path_to_csv")
end


function main_download_Anscombe()
    data = dataset("datasets", "anscombe")
    save_Anscombe_to_csv(data,"$(@__DIR__)/../../data/anscombe.csv")
end

if abspath(PROGRAM_FILE) == @__FILE__
    main_download_Anscombe()
end

