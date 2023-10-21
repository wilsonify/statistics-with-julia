# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""partial_difference_quotient-input

    PartialDifferenceQuotientInput(;
        v=nothing,
        i=nothing,
        h=nothing,
    )

    - v::Vector{Float64} : vector
    - i::Any
    - h::Any
"""
Base.@kwdef mutable struct PartialDifferenceQuotientInput <: OpenAPI.APIModel
    v::Union{Nothing, Vector{Float64}} = nothing
    i::Union{Nothing, Any} = nothing
    h::Union{Nothing, Any} = nothing

    function PartialDifferenceQuotientInput(v, i, h, )
        OpenAPI.validate_property(PartialDifferenceQuotientInput, Symbol("v"), v)
        OpenAPI.validate_property(PartialDifferenceQuotientInput, Symbol("i"), i)
        OpenAPI.validate_property(PartialDifferenceQuotientInput, Symbol("h"), h)
        return new(v, i, h, )
    end
end # type PartialDifferenceQuotientInput

const _property_types_PartialDifferenceQuotientInput = Dict{Symbol,String}(Symbol("v")=>"Vector{Float64}", Symbol("i")=>"Any", Symbol("h")=>"Any", )
OpenAPI.property_type(::Type{ PartialDifferenceQuotientInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_PartialDifferenceQuotientInput[name]))}

function check_required(o::PartialDifferenceQuotientInput)
    true
end

function OpenAPI.validate_property(::Type{ PartialDifferenceQuotientInput }, name::Symbol, val)
end
