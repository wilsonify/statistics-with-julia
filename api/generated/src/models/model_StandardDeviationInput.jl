# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""standard_deviation-input

    StandardDeviationInput(;
        x=nothing,
    )

    - x::Vector{Float64}
"""
Base.@kwdef mutable struct StandardDeviationInput <: OpenAPI.APIModel
    x::Union{Nothing, Vector{Float64}} = nothing

    function StandardDeviationInput(x, )
        OpenAPI.validate_property(StandardDeviationInput, Symbol("x"), x)
        return new(x, )
    end
end # type StandardDeviationInput

const _property_types_StandardDeviationInput = Dict{Symbol,String}(Symbol("x")=>"Vector{Float64}", )
OpenAPI.property_type(::Type{ StandardDeviationInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_StandardDeviationInput[name]))}

function check_required(o::StandardDeviationInput)
    true
end

function OpenAPI.validate_property(::Type{ StandardDeviationInput }, name::Symbol, val)
end
