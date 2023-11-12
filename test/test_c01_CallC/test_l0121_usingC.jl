# Julia allows C and Fortran calls to be made directly without adding any extra overhead than a standard library call
# Note that the code to be called must be available as a shared library.

function cos_c()
    if Sys.iswindows()
        result = ccall((:cos, "msvcrt"), Float64, (Float64,), pi )
    else
        result = ccall(:cos, Float64, (Float64,), π)
    end
    return result
end



using Test

# Define a test for ccall with cos function
@testset "Test ccall with cos function" begin
    # Define a tolerance for floating-point comparisons
    atol = 1e-6
    result = cos_c()
    @test result == -1.0
end
