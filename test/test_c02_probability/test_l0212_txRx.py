

def test_bayes_rule(self):
    prob1 = 0.7
    eps0 = 0.1
    eps1 = 0.05
    analytic = bayes_rule(prob1, eps0, eps1)
    assert round(analytic, 4) == 0.9568
