# Julia allows C and Fortran calls to be made directly without adding any extra overhead than a standard library call
# Note that the code to be called must be available as a shared library.
using Sys

if Sys.iswindows()
    ccall((:cos, "msvcrt"), Float64, (Float64,), pi )
else
    ccall((:cos, "libc"), Float64, (Float64,), pi)
end


using Test

# Define a test for ccall with cos function
@testset "Test ccall with cos function" begin
    # Define a tolerance for floating-point comparisons
    atol = 1e-6

    if Sys.iswindows()
        result = ccall((:cos, "msvcrt"), Float64, (Float64,), π)
    else
        result = ccall((:cos, "libc"), Float64, (Float64,), π)
    end

    @test abs(result - (-1.0)) < atol  # Assuming π returns -1.0 when using cos
end
