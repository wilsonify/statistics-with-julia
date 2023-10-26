"""
Transmitted (Tx) and Received (Rx) Bayes
====
As an example, consider a communication channel involving a stream of transmitted bits
(0’s and #1’s), where 70% of the bits are 1, and the rest 0.
A typical snippet from the channel  ...0101101011101111101...

The channel is imperfect due to physical disturbances such as interfering radio signals,
and furthermore the bits received are sometimes distorted.
Hence, there is a chance (ε0 ) of interpreting a bit as 1 when it is actually 0,
and similarly there is a chance (ε1 ) of interpreting a bit as 0 when it is actually 1.
Now say that we received (Rx) a bit, and interpreted it as 1.
This is the posterior outcome.
What is the chance that it was in fact transmitted (Tx) as a 1?
Applying Bayes’ rule:
P(Tx1 | Rx1) = (P(Rx1 | Tx1) * P(Tx1)) / P(Rx1) =  ((1 − ε1)*0.7)/(0.7*(1-ε1)+0.3*ε0)
For example, if ε0 = 0.1 and ε1 = 0.05 we have that P(Tx 1 | Rx 1) = 0.9568.
Listing 2.12 illustrates
this via simulation.
"""

import numpy as np

np.random.seed(1)


def flip_with_prob(bit, prob):
    return not bit if np.random.rand() < prob else bit


def bayes_rule(prob1, eps0, eps1):
    analytic = ((1 - eps1) * prob1) / ((1 - eps1) * prob1 + (1 - prob1) * eps0)
    return analytic


def simulation(prob1, eps0, eps1):
    N = 10**5
    tx_data = np.random.rand(N) < prob1
    rx_data = []
    num_tx1 = 0
    total_rx1 = 0
    for x in tx_data:
        if x == 0:
            result = flip_with_prob(x, eps0)
        else:
            result = flip_with_prob(x, eps1)
        rx_data.append(result)
        if result == 1:
            total_rx1 += 1
            num_tx1 += x
    monte_carlo = num_tx1 / total_rx1
    return monte_carlo


def main():
    prob1 = 0.7
    eps0 = 0.1
    eps1 = 0.05
    analytic = bayes_rule(prob1, eps0, eps1)
    print(f"Analytic: {analytic:.6f}")
    monte_carlo = simulation(prob1, eps0, eps1)
    print(f"Monte Carlo: {monte_carlo:.6f}")
