# Creating and inspecting a DataFrame
#=
In line 1,
we specify use of the DataFrames package,
which allows us to use DataFrame type objects.
We also use the CSV package for reading csv files.
In line 2,
CSV.read() is used to create a data frame object,
populated with data from the file specified.
Note that our file has a header row,
however in cases where there isn’t a header use header = false.
We use copycols = true to create a data frame with mutable columns (the default is false).
If the default was used, each column would be of the read-only CSV.Column type.
In line 4
the size() function is used to return the number of rows and columns of the data frame as a tuple.
Two other useful functions not shown here are nrow() and ncol(),
which return the number of rows and number of columns, respectively.
In line 5,
the names() function is used to return an array of all column names as symbols.
In line 6,
the first() function is used to display the first six lines of the data frame,
as specified by the second argument.
Note that last() can be used to display the last several rows instead.
In line 7, describe() is used to create a data frame with a
summary of the data in each column of the input data frame (data in our case).
On inspection, by looking at the nmissing column,
one can see there are missing values present,
and we return to this problem in Listing 4.7.
=#

using DataFrames, CSV
path_to_here = @__DIR__
path_to_data = abspath("$path_to_here/../../data")
print("path_to_data=$path_to_data")
data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)

println(size(data),"\n")
println(names(data),"\n")
println(first(data, 6),"\n")
println(describe(data),"\n")


# Creating and inspecting a DataFrame
using DataFrames, CSV
using Test
path_to_here = @__DIR__
include("$path_to_here/t01_are_dataframes_equal.jl")
include("$path_to_here/t02_are_lists_equal.jl")
include("$path_to_here/t04_dataframe_to_dict.jl")

path_to_data = abspath("$path_to_here/../../data")

@testset "DataFrame" begin
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test size(data) == (200, 4)
    @test names(data) == ["Name", "Date", "Grade", "Price"]
    expected_data = DataFrame(Grade = ["A", "B", "E", missing, "C", "D"],
        Price = [79700, missing, 24311, 38904, 47052, 34365],
        Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
        Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"])
    @test are_dataframes_equal(first(data, 6), expected_data)
end
