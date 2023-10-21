# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


@doc raw"""accuracy-input

    AccuracyInput(;
        tp=nothing,
        fp=nothing,
        fn=nothing,
        tn=nothing,
    )

    - tp::Float64 : number of True Positives
    - fp::Float64 : number of False Positives
    - fn::Float64 : number of False Negatives
    - tn::Float64 : number of True Negatives
"""
Base.@kwdef mutable struct AccuracyInput <: OpenAPI.APIModel
    tp::Union{Nothing, Float64} = nothing
    fp::Union{Nothing, Float64} = nothing
    fn::Union{Nothing, Float64} = nothing
    tn::Union{Nothing, Float64} = nothing

    function AccuracyInput(tp, fp, fn, tn, )
        OpenAPI.validate_property(AccuracyInput, Symbol("tp"), tp)
        OpenAPI.validate_property(AccuracyInput, Symbol("fp"), fp)
        OpenAPI.validate_property(AccuracyInput, Symbol("fn"), fn)
        OpenAPI.validate_property(AccuracyInput, Symbol("tn"), tn)
        return new(tp, fp, fn, tn, )
    end
end # type AccuracyInput

const _property_types_AccuracyInput = Dict{Symbol,String}(Symbol("tp")=>"Float64", Symbol("fp")=>"Float64", Symbol("fn")=>"Float64", Symbol("tn")=>"Float64", )
OpenAPI.property_type(::Type{ AccuracyInput }, name::Symbol) = Union{Nothing,eval(Base.Meta.parse(_property_types_AccuracyInput[name]))}

function check_required(o::AccuracyInput)
    true
end

function OpenAPI.validate_property(::Type{ AccuracyInput }, name::Symbol, val)
end
