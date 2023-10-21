# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""distance-output

    DistanceOutput(;
        x=nothing,
        result=nothing,
    )

    - x::Float64
    - result::Float64
"""
Base.@kwdef mutable struct DistanceOutput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing
    result::Union{Nothing, Float64} = nothing

    function DistanceOutput(x, result, )
        OpenAPI.validate_property(DistanceOutput, Symbol("x"), x)
        OpenAPI.validate_property(DistanceOutput, Symbol("result"), result)
        return new(x, result, )
    end
end # type DistanceOutput

const _property_types_DistanceOutput = Dict{Symbol,String}(Symbol("x")=>"Float64", Symbol("result")=>"Float64", )
OpenAPI.property_type(::Type{ DistanceOutput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_DistanceOutput[name]))}

function check_required(o::DistanceOutput)
    true
end

function OpenAPI.validate_property(::Type{ DistanceOutput }, name::Symbol, val)
end
