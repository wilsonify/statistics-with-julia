
module c12_toy_application
  include("c12_toy_application/MyApp.jl")
  include("c12_toy_application/app_precompile.jl")
  include("c12_toy_application/custom_sysimage.jl")
  include("c12_toy_application/generate_csv_precompile.jl")
end