# Creating and inspecting a DataFrame
using DataFrames, CSV
using Test
@testset "DataFrame" begin
    path_to_here = @__DIR__
    path_to_data = abspath("$path_to_here/../../data")    
    data = CSV.read("$path_to_data/purchaseData.csv", DataFrame, copycols = true)
    @test size(data)==(200, 4)
    @test names(data)==["Name", "Date", "Grade", "Price"]
    @test first(data, 6)==DataFrame(
      Grade = ["A", "B", "E", missing, "C", "D"],
      Price = [79700, missing, 24311, 38904, 47052, 34365],
      Date = ["14/09/2008", "11/03/2008", "5/08/2008", "2/09/2008", "1/12/2008", "17/05/2008"],
      Name = ["MARYANNA", "REBECCA", "ASHELY", "KHADIJAH", "TANJA", "JUDIE"]
    )

end
