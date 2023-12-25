using RDatasets
using CSV

function save_xclara_to_csv(data, path_to_csv)
    CSV.write(path_to_csv, data)
    println("saved to $path_to_csv")
end

function main_download_xclara()
    data = dataset("cluster", "xclara")

    save_xclara_to_csv(data,"$(@__DIR__)/../../data/xclara.csv")
end

if abspath(PROGRAM_FILE) == @__FILE__
    @time main_download_xclara()
end
