# Call by value vs. call by reference

f(z::Int) = begin
    z = 0
end
f(z::Array{Int}) = begin
    z[1] = 0
end

using Test

@testset "" begin
    x = 1
    @test typeof(x) == Int
    @test isimmutable(x) == true
end

@testset "" begin
    x = 1
    println("Before call by value: ", x)
    f(x)
    println("After call by value: ", x, "\n")
end

@testset "" begin
    x = [1]
    @test typeof(x) == Array{Int64,1}
    @test isimmutable(x) == false
end

@testset "" begin
    x = [1]
    println("Before call by reference: ", x)
    f(x)
    println("After call by reference: ", x)
end
