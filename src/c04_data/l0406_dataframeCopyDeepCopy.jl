# Using copy() and deepcopy() with a DataFrame
#=
We first create a data frame from a csv file where data1.Name[1] is the string MARYANNA.
Then in lines 5–7,
setting data2 = data1 simply implies that data2 refers to the same object as data1.
Hence, modifying data2 in line 6 results in a modification of data1.
In lines 9–13,
we circumvent such a situation by using the copy() function.
In this case setting, the new name into data2, EMILY, does not affect data1.
However, in other cases a shallow copy isn’t enough for separating data frames.
This is the case in lines 15–19
where we create a data frame with a column named X comprised of arrays.
In this case, the copied data frame, data2, still refers to the original entries (arrays),
because these are mutable and were not copied via copy() in line 17.
The consequence is that modifying a specific entry of data2 as in line 18 actually modifies data1.
This is then circumvented by using deepcopy() as in lines 21–24.
=#
using DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
println("Original value: ", data1.Name[1],"\n")

data2 = data1
data2.Name[1] = "EMILY"
@show data1.Name[1]

data1 = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
data2 = copy(data1)
data2.Name[1] = "EMILY"
@show data1.Name[1]
println()

data1 = DataFrame()
data1.X = [[0, 1], [100, 101]]
data2 = copy(data1)
data2.X[1][1] = -1
@show data1.X[1][1]

data1 = DataFrame(X = [[0, 1], [100, 101]])
data2 = deepcopy(data1)
data2.X[1][1] = -1
@show data1.X[1][1];

using DataFrames, CSV

path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")

function read_purchaseData()
    df = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    return df
end

@testset "reference test" begin
    data1 = read_purchaseData()
    @test data1.Name[1] == "MARYANNA"
    data2 = data1
    data2.Name[1] = "EMILY"
    @test data1.Name[1] == "EMILY"
end
@testset "named access test" begin
    data1 = read_purchaseData()
    data2 = copy(data1)
    data2.Name[1] = "EMILY"
    @test data1.Name[1] == "MARYANNA"
end
@testset "shallow copy test" begin
    data1 = DataFrame()
    data1.X = [[0, 1], [100, 101]]
    data2 = copy(data1)
    data2.X[1][1] = -1
    @test data1.X[1][1] == -1
end
@testset "deepcopy test" begin
    data1 = DataFrame(X = [[0, 1], [100, 101]])
    data2 = deepcopy(data1)
    data2.X[1][1] = -1
    @test data1.X[1][1] == 0
end
