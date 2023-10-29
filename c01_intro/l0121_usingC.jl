# Julia allows C and Fortran calls to be made directly without adding any extra overhead than a standard library call
# Note that the code to be called must be available as a shared library.

if Sys.iswindows()
    ccall((:cos, "msvcrt"), Float64, (Float64,), pi )
else
    result = ccall(:cos, Float64, (Float64,), π)
end
