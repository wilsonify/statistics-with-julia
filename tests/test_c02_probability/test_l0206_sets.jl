using Test

A = Set([2, 7, 2, 3])
B = Set(1:6)
omega = Set(1:10)

@testset "Basic Set Operations" begin
    @test union(A, B) == Set([1, 2, 3, 4, 5, 6, 7])
    @test intersect(A, B) == Set([2, 3])
    @test setdiff(B, A) == Set([1, 4, 5, 6])
    @test setdiff(omega, B) == Set([8, 9, 10])
    @test union(setdiff(A, B), setdiff(B, A)) == Set([1, 4, 5, 6])
    @test in(6, A) == true
    @test issubset(Set([1, 4, 5, 6]), Set([1, 2, 3, 4, 5, 6, 7])) == true
    @test issubset(intersect(A, B), Set([1, 2, 3, 4, 5, 6, 7])) == true
end
