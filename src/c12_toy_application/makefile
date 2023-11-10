
project.toml:
	julia setup.jl

run:
	time julia --project=. MyApp.jl FL_insurance_sample.csv

csv_precompile.jl:
	julia --project=. --startup-file=no --trace-compile=csv_precompile.jl generate_csv_precompile.jl

app_precompile.jl:
	julia --project=. --startup-file=no --trace-compile=app_precompile.jl MyApp.jl "FL_insurance_sample.csv"

custom_sysimage.o:
	julia --startup-file=no -J"/opt/julia/v1.5.4/lib/julia/sys.so" --output-o sys.o custom_sysimage.jl

custom_sysimage:
	gcc -shared -o sys.so -fPIC -Wl,--whole-archive sys.o -Wl,--no-whole-archive -L"/opt/julia/v1.5.4/lib" -ljulia

exe:
	gcc -DJULIAC_PROGRAM_LIBNAME=\"sys.so\" -o MyApp MyApp.c sys.so -O2 -fPIE -I'/opt/julia/v1.5.4/include/julia' -L'/opt/julia/v1.5.4/lib' -ljulia -Wl,-rpath,'/opt/julia/v1.5.4/lib:$ORIGIN'