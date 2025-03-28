# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""correlation-output

    CorrelationOutput(;
        x=nothing,
        result=nothing,
    )

    - x::Float64
    - result::Float64
"""
Base.@kwdef mutable struct CorrelationOutput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing
    result::Union{Nothing, Float64} = nothing

    function CorrelationOutput(x, result, )
        OpenAPI.validate_property(CorrelationOutput, Symbol("x"), x)
        OpenAPI.validate_property(CorrelationOutput, Symbol("result"), result)
        return new(x, result, )
    end
end # type CorrelationOutput

const _property_types_CorrelationOutput = Dict{Symbol,String}(Symbol("x")=>"Float64", Symbol("result")=>"Float64", )
OpenAPI.property_type(::Type{ CorrelationOutput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_CorrelationOutput[name]))}

function check_required(o::CorrelationOutput)
    true
end

function OpenAPI.validate_property(::Type{ CorrelationOutput }, name::Symbol, val)
end
