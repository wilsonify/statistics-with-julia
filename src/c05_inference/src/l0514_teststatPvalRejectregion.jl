#=
H0 is the null hypothesis.
The distribution of the test statistic, X ∗ , under H0 .
With α = 0.05 the rejection region is to the left of the black dashed line.
In a speciﬁc sample, the test statistic is on the red line and we reject H0 .
=#
using Distributions, Random, Statistics, Plots; gr()
using Distributions, Random, Statistics, Plots; gr()

# ts() calculates the test statistic from a sample.
ts(sample) = maximum(sample) - minimum(sample)



function main_l0514_teststatPvalRejectregion()
    Random.seed!(2)
    n, N, alpha = 10, 10^7, 0.05
    mActual = 0.75
    dist0, dist1 = Uniform(0,1), Uniform(0,mActual)
    # obtain N samples under H0 calculate the rejectionValue, q0(α).
    empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]
    rejectionValue = quantile(empiricalDistUnderH0,alpha)

    # collect our sample, simulating a point in H1 (since mActual = 0.75).
    sample = rand(dist1,n)
    # calculate the test statistic
    testStat = ts(sample)
    # calculate the p-value in
    pValue = sum(empiricalDistUnderH0 .<= testStat) / N
    # execute the decision rule
    if testStat > rejectionValue
        print("Didn't reject: ", round(testStat,digits = 4))
        print(" > ", round(rejectionValue,digits = 4))
    else
        print("Reject: ", round(testStat,digits = 4))
        print(" <= ", round(rejectionValue,digits = 4))
    end

    println("\np-value = $(round(pValue,digits = 4))")

    # create Figure
    stephist(
        empiricalDistUnderH0,
        bins = 100,
        c = :blue,
        normed = true,
        label = ""
    )
    plot!(
        [testStat, testStat],
        [0, 4],
        c = :red,
        label = "Observed test statistic"
    )
    plot!(
        [rejectionValue, rejectionValue],
        [0, 4],
        c = :black,
        ls = :dash,
        label = "Critical value boundary",
        legend = :topleft,
        ylims = (0,4),
        xlabel = "x",
        ylabel = "Density"
    )
end