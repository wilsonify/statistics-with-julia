# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""minimize_batch-input

    MinimizeBatchInput(;
        x=nothing,
    )

    - x::Float64
"""
Base.@kwdef mutable struct MinimizeBatchInput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing

    function MinimizeBatchInput(x, )
        OpenAPI.validate_property(MinimizeBatchInput, Symbol("x"), x)
        return new(x, )
    end
end # type MinimizeBatchInput

const _property_types_MinimizeBatchInput = Dict{Symbol,String}(Symbol("x")=>"Float64", )
OpenAPI.property_type(::Type{ MinimizeBatchInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_MinimizeBatchInput[name]))}

function check_required(o::MinimizeBatchInput)
    true
end

function OpenAPI.validate_property(::Type{ MinimizeBatchInput }, name::Symbol, val)
end
