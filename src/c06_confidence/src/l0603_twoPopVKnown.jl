#=
Two Sample Confidence Intervals for the Difference in Means

# This listing is similar to those previously covered in this chapter.
=#

using CSV, Distributions, HypothesisTests, DataFrames

function confidence_interval_two_pop_known_var_formula(data1, data2)
    alpha = 0.05
    sig1, sig2 = 1.2, 1.6
	xBar1, xBar2 = mean(data1), mean(data2)
    n1, n2 = length(data1), length(data2)
    z = quantile(Normal(),1 - alpha / 2)
    lower = xBar1 - xBar2 - z*sqrt(sig1^2 / n1 + sig2^2 / n2)
    upper = xBar1 - xBar2 + z*sqrt(sig1^2 / n1 + sig2^2 / n2)
    return (lower,upper)
    end

function main_l0603_twoPopVKnown()
	path_to_here = @__DIR__
	path_to_data = abspath("$path_to_here/../../data")

	data1 = CSV.read("$path_to_data/machine1.csv", DataFrame, header=false)[:,1]
	data2 = CSV.read("$path_to_data/machine2.csv", DataFrame, header=false)[:,1]
	# The sample means and number of observations are calculated in lines 5–6.

	xBar1, xBar2 = mean(data1), mean(data2)
	n1, n2 = length(data1), length(data2)

	# set the standard deviations of both populations since they are known
	sig1, sig2 = 1.2, 1.6
	# set the confidence level
	alpha = 0.05

	# calculate the quantile, z, on a standard Normal distribution
	z = quantile(Normal(),1-alpha/2)

	# In lines 11–12 the confidence interval (6.8) is evaluated manually and printed as output.

	lower = xBar1 - xBar2 - z*sqrt(sig1^2/n1+sig2^2/n2)
	upper = xBar1 - xBar2 + z*sqrt(sig1^2/n1+sig2^2/n2)
	println("Calculating formula: ", (lower, upper))
end

export confidence_interval_two_pop_known_var_formula