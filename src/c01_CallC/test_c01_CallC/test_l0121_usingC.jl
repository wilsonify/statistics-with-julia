# Julia allows C and Fortran calls to be made directly without adding any extra overhead than a standard library call
# Note that the code to be called must be available as a shared library.
using StatisticsWithJulia: cos_c
using Test

# Define a test for ccall with cos function
@testset "Test ccall with cos function" begin
    # Define a tolerance for floating-point comparisons
    atol = 1e-6
    result = cos_c()
    @test result == -1.0
end
