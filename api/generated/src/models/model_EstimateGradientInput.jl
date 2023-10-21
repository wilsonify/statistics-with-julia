# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""estimate_gradient-input

    EstimateGradientInput(;
        v=nothing,
        h=nothing,
    )

    - v::Vector{Float64}
    - h::Float64
"""
Base.@kwdef mutable struct EstimateGradientInput <: OpenAPI.APIModel
    v::Union{Nothing, Vector{Float64}} = nothing
    h::Union{Nothing, Float64} = nothing

    function EstimateGradientInput(v, h, )
        OpenAPI.validate_property(EstimateGradientInput, Symbol("v"), v)
        OpenAPI.validate_property(EstimateGradientInput, Symbol("h"), h)
        return new(v, h, )
    end
end # type EstimateGradientInput

const _property_types_EstimateGradientInput = Dict{Symbol,String}(Symbol("v")=>"Vector{Float64}", Symbol("h")=>"Float64", )
OpenAPI.property_type(::Type{ EstimateGradientInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_EstimateGradientInput[name]))}

function check_required(o::EstimateGradientInput)
    true
end

function OpenAPI.validate_property(::Type{ EstimateGradientInput }, name::Symbol, val)
end
