# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""sqrt-input

    SqrtInput(;
        x=nothing,
    )

    - x::Float64
"""
Base.@kwdef mutable struct SqrtInput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing

    function SqrtInput(x, )
        OpenAPI.validate_property(SqrtInput, Symbol("x"), x)
        return new(x, )
    end
end # type SqrtInput

const _property_types_SqrtInput = Dict{Symbol,String}(Symbol("x")=>"Float64", )
OpenAPI.property_type(::Type{ SqrtInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SqrtInput[name]))}

function check_required(o::SqrtInput)
    true
end

function OpenAPI.validate_property(::Type{ SqrtInput }, name::Symbol, val)
end
