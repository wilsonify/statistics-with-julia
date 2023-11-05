all: clean environment l0118_usingR

clean:
	rm -f Manifest.toml
	rm -f Project.toml

environment:
	julia setup.jl

l0118_usingR:
	julia --project=. l0118_usingR.jl
