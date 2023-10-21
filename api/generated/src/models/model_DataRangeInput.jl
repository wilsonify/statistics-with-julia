# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""data_range-input

    DataRangeInput(;
        x=nothing,
    )

    - x::Vector{Float64}
"""
Base.@kwdef mutable struct DataRangeInput <: OpenAPI.APIModel
    x::Union{Nothing, Vector{Float64}} = nothing

    function DataRangeInput(x, )
        OpenAPI.validate_property(DataRangeInput, Symbol("x"), x)
        return new(x, )
    end
end # type DataRangeInput

const _property_types_DataRangeInput = Dict{Symbol,String}(Symbol("x")=>"Vector{Float64}", )
OpenAPI.property_type(::Type{ DataRangeInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_DataRangeInput[name]))}

function check_required(o::DataRangeInput)
    true
end

function OpenAPI.validate_property(::Type{ DataRangeInput }, name::Symbol, val)
end
