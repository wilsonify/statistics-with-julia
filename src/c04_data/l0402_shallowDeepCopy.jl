# Deep copy and shallow copy
#=
Lines 1–5
exhibit no surprise due to immutability.
The Int64 a is assigned to b and b is modified in line 4.
At this point, Julia creates a copy because the variable is immutable.
Lines 7–11
demonstrate different behavior.
The array a is mutable and hence after b is assigned to a in line 9,
the modification of b in line 10 also modifies a.
Lines 13–17
show a case where a copy() of a is created.
In this case, modification of b in line 16 does not alter a.
Lines 19–23
are similar, however in this case, the fact that copy() is only a shallow copy matters.
The variable b has a new outer array, however the inner array is still shared with a.
Hence, the modification in line 22 modifies the inner array of a as well.
Finally, in lines 25–29,
this is resolved by creating a deepcopy().
=#
println("Immutable:")
a = 10
b = a
b = 20
@show a

println("\nNo copy:")
a = [10]
b = a
b[1] = 20
@show a

println("\nCopy:")
a = [10]
b = copy(a)
b[1] = 20
@show a

println("\nShallow copy:")
a = [[10]]
b = copy(a)
b[1][1] = 20
@show a

println("\nDeep copy:")
a = [[10]]
b = deepcopy(a)
b[1][1] = 20
@show a;


# Deep copy and shallow copy
using Test
@testset "Immutable" begin
    a = 10
    b = a
    b = 20
    @test a == 10
end

@testset "No copy" begin
    a = [10]
    b = a
    b[1] = 20
    @test a == [20]
end
@testset "Copy" begin
    a = [10]
    b = copy(a)
    b[1] = 20
    @test a == [10]
end

@testset "Shallow copy" begin
    a = [[10]]
    b = copy(a)
    b[1][1] = 20
    @test a == [[20]]
end
@testset "Deep copy" begin
    a = [[10]]
    b = deepcopy(a)
    b[1][1] = 20
    @test a == [[10]]
end
