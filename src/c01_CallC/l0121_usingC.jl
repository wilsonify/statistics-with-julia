# Julia allows C and Fortran calls to be made directly
# without adding any extra overhead than a standard library call
# Note that the code to be called must be available as a shared library.

function cos_c()
    if Sys.iswindows()
        result = ccall((:cos, "msvcrt"), Float64, (Float64,), pi )
    else
        result = ccall(:cos, Float64, (Float64,), π)
    end
    return result
end

if abspath(PROGRAM_FILE) == @__FILE__
    result = cos_c()
    println(result)
end



