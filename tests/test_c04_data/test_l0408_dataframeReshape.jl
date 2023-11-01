using DataFrames, CSV
function main()
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../data")

    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

    newCol = DataFrame(Validated = ones(Int, size(data, 1)))
    newRow = DataFrame([["JOHN", "JACK"] [123456, 909595]], [:Name, :PhoneNo])
    newData = DataFrame(
        Name = ["JOHN", "ASHELY", "MARYANNA"],
        Job = ["Lawyer", "Doctor", "Lawyer"],
    )

    data = hcat(data, newCol)
    println(first(data, 3), "\n")

    data = vcat(data, newRow, cols = :union)
    println(last(data, 3), "\n")

    #data = leftjoin(data, newData, on=:Name)
    data = leftjoin(data, newData, on = :Name, matchmissing = :notequal)


    println(data, "\n")

    select!(data, [:Name, :Job])
    println(data, "\n")

    unique!(data, :Job)
    println(data)
end
