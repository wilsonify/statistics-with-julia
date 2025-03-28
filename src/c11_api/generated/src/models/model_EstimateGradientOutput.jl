# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""estimate_gradient-output

    EstimateGradientOutput(;
        x=nothing,
        result=nothing,
    )

    - x::Float64
    - result::Float64
"""
Base.@kwdef mutable struct EstimateGradientOutput <: OpenAPI.APIModel
    x::Union{Nothing, Float64} = nothing
    result::Union{Nothing, Float64} = nothing

    function EstimateGradientOutput(x, result, )
        OpenAPI.validate_property(EstimateGradientOutput, Symbol("x"), x)
        OpenAPI.validate_property(EstimateGradientOutput, Symbol("result"), result)
        return new(x, result, )
    end
end # type EstimateGradientOutput

const _property_types_EstimateGradientOutput = Dict{Symbol,String}(Symbol("x")=>"Float64", Symbol("result")=>"Float64", )
OpenAPI.property_type(::Type{ EstimateGradientOutput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_EstimateGradientOutput[name]))}

function check_required(o::EstimateGradientOutput)
    true
end

function OpenAPI.validate_property(::Type{ EstimateGradientOutput }, name::Symbol, val)
end
