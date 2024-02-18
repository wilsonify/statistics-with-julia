
module c14_MyLib
  include("c14_MyLib/build/additional_precompile.jl")
  include("c14_MyLib/build/build.jl")
  include("c14_MyLib/build/generate_precompile.jl")
  include("c14_MyLib/src/MyLib.jl")
end