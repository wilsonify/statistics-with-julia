# copy this file to you ~/.julia/config folder
try
    using Revise    
catch e
    @warn "Error using Revise" exception=(e, catch_backtrace())
    try
        using Pkg
        Pkg.add("Revise")    
        using Revise
    catch e
        @warn "Error initializing Revise" exception=(e, catch_backtrace())
    end
end
