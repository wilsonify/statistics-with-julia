#=
The law of large numbers breaks down with very heavy tails
Consider a drone hovering stationary in the sky at unit height.
A pivoting laser is attached to its undercarriage, which shoots pulses at the ground.
At any point the laser fires, it makes an angle θ from the vertical

|
|                      xx
|                   xxx |xx
|                 xx    |  xxx
|                xx  θ  |    xxx
|              xxx      |       xxx
|            xxx        | ^        xxx
|           xx        ^^|^ ^         xxx
|         xx       ^  ^ |> <^^         xxx
|      xxxx       <v^ v |> <v>           xx
|   xxx         ^  ^ v |> ^ ^  ^          xx
| xx         ^  v  v v |> v v  ^^  ^       xx
|xx      ^    v  v  v  ^|> v  ^  ^  v ^    ^ xx
|x        v    v  v  v  <|> <^ v ^> ^> v   ^   ^xx
-----------------------------------------------------
=#
using Random, Plots; gr()

function generate_cauchy_data(n)
    #create an array of n Cauchy random variables constructed through the angle mechanism
    return tan.(rand(n) * pi .- pi / 2)
end

function  running_proportion(data)
    # create a running sum, and then divide this element-wise by the array collect(1:n).
    # Notice that “+” is used as the first argument to accumulate(). the + is a function.
    n = length(data)
    return accumulate(+,data)./collect(1:n)
end

function main_l0330_cauchyCMA()
    n = 10^6
    data = generate_cauchy_data(n)
    averages = running_proportion(data)
    # plot the running average.
    plot( 1:n, averages,  c = :blue, legend = :none, xscale = :log10, xlims = (1,n), xlabel = "n", ylabel = "Running average")
end


if abspath(PROGRAM_FILE) == @__FILE__
    generate_cauchy_data()
end