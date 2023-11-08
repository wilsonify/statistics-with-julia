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
