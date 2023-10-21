# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""get_column-output

    GetColumnOutput(;
        x=nothing,
        result=nothing,
    )

    - x::Float64
    - result::Float64
"""
Base.@kwdef mutable struct GetColumnOutput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing
    result::Union{Nothing, Float64} = nothing

    function GetColumnOutput(x, result, )
        OpenAPI.validate_property(GetColumnOutput, Symbol("x"), x)
        OpenAPI.validate_property(GetColumnOutput, Symbol("result"), result)
        return new(x, result, )
    end
end # type GetColumnOutput

const _property_types_GetColumnOutput = Dict{Symbol,String}(Symbol("x")=>"Float64", Symbol("result")=>"Float64", )
OpenAPI.property_type(::Type{ GetColumnOutput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_GetColumnOutput[name]))}

function check_required(o::GetColumnOutput)
    true
end

function OpenAPI.validate_property(::Type{ GetColumnOutput }, name::Symbol, val)
end
