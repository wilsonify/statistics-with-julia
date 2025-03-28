# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""squared_distance-input

    SquaredDistanceInput(;
        v=nothing,
        w=nothing,
    )

    - v::Vector{Float64}
    - w::Vector{Float64}
"""
Base.@kwdef mutable struct SquaredDistanceInput <: OpenAPI.APIModel
    v::Union{Nothing, Vector{Float64}} = nothing
    w::Union{Nothing, Vector{Float64}} = nothing

    function SquaredDistanceInput(v, w, )
        OpenAPI.validate_property(SquaredDistanceInput, Symbol("v"), v)
        OpenAPI.validate_property(SquaredDistanceInput, Symbol("w"), w)
        return new(v, w, )
    end
end # type SquaredDistanceInput

const _property_types_SquaredDistanceInput = Dict{Symbol,String}(Symbol("v")=>"Vector{Float64}", Symbol("w")=>"Vector{Float64}", )
OpenAPI.property_type(::Type{ SquaredDistanceInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_SquaredDistanceInput[name]))}

function check_required(o::SquaredDistanceInput)
    true
end

function OpenAPI.validate_property(::Type{ SquaredDistanceInput }, name::Symbol, val)
end
