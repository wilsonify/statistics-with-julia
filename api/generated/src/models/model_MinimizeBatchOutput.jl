# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""minimize_batch-output

    MinimizeBatchOutput(;
        x=nothing,
        result=nothing,
    )

    - x::Float64
    - result::Float64
"""
Base.@kwdef mutable struct MinimizeBatchOutput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing
    result::Union{Nothing, Float64} = nothing

    function MinimizeBatchOutput(x, result, )
        OpenAPI.validate_property(MinimizeBatchOutput, Symbol("x"), x)
        OpenAPI.validate_property(MinimizeBatchOutput, Symbol("result"), result)
        return new(x, result, )
    end
end # type MinimizeBatchOutput

const _property_types_MinimizeBatchOutput = Dict{Symbol,String}(Symbol("x")=>"Float64", Symbol("result")=>"Float64", )
OpenAPI.property_type(::Type{ MinimizeBatchOutput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_MinimizeBatchOutput[name]))}

function check_required(o::MinimizeBatchOutput)
    true
end

function OpenAPI.validate_property(::Type{ MinimizeBatchOutput }, name::Symbol, val)
end
