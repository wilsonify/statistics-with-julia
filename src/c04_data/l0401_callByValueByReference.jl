# Call by value vs. call by reference
# note the use of the @show macro,
# useful for debugging or understanding code.

# we implement a method of f() for integer types.
# The code z = 0 will operate on a local copy of z.
f_immutable(z::Int) = begin z = 0 end

# we implement a method of f() for arrays.
# Here, the code z[1] = 0 will modify the first entry of the input argument z.
f_mutable(z::Array{Int}) = begin  z[1] = 0  end

function main_l0401_callByValueByReference()
    # passing the variable x into f() does not modify x.
    x = 1
    @show typeof(x)
    @show isimmutable(x)
    println("Before call by value: ", x)
    f_immutable(x)
    println("After call by value: ", x,"\n")

    # multiple dispatch, f(x) modifies the original x.
    x = [1]
    @show typeof(x)
    @show isimmutable(x)
    println("Before call by reference: ", x)
    f_mutable(x)
    println("After call by reference: ", x)

end

# Call by value vs. call by reference
using StatisticsWithJulia: f_mutable
using StatisticsWithJulia: f_immutable
using Test


@testset "f_immutable" begin
    x = 1
    @test typeof(x) == Int
    @test isimmutable(x) == true
    @test x == 1
    f_immutable(x)
    @test x == 1
end


@testset "f_immutable" begin
    x = [1]
    @test typeof(x) == Array{Int64, 1}
    @test isimmutable(x) == false
    @test x == [1]
    f_immutable(x)
    @test x == [0]
end
