# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""mode-input

    ModeInput(;
        x=nothing,
    )

    - x::Vector{Float64}
"""
Base.@kwdef mutable struct ModeInput <: OpenAPI.APIModel
    x::Union{Nothing, Vector{Float64}} = nothing

    function ModeInput(x, )
        OpenAPI.validate_property(ModeInput, Symbol("x"), x)
        return new(x, )
    end
end # type ModeInput

const _property_types_ModeInput = Dict{Symbol,String}(Symbol("x")=>"Vector{Float64}", )
OpenAPI.property_type(::Type{ ModeInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_ModeInput[name]))}

function check_required(o::ModeInput)
    true
end

function OpenAPI.validate_property(::Type{ ModeInput }, name::Symbol, val)
end
