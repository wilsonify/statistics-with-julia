
based on 

Statistics with Julia: 
Fundamentals for Data Science, Machine Learning and Artificial Intelligence

by H.Klok , Y.Nazarathy


This repository is a collection of code blocks contained within that book. 
It contains the following ten chapters and three appendices:

1. Introducing Julia
2. Basic Probability
3. Probability Distributions
4. Processing and Summarizing Data
5. Statistical Inference Ideas
6. Confidence Intervals
7. Hypothesis Testing
8. Linear Regression
9. Machine Learning Basics
10. Simulation of Dynamic Models


Appendix A. How-to in Julia

Appendix B. Additional Language Features

Appendix C. Additional Packages


# Getting Started

#### Install Julia > 1.6
```
source scripts/install_julia 1 7 2
```

#### Install Julia Packages
    
```
julia --project="~/.julia/environments/v1.7" setup.jl
```

#### Run Tests

```
julia --project="~/.julia/environments/v1.7" test/runtests.jl
```

# Contribute

1. Open an Issue
2. Create a Fork
3. Submit a Pull Request into the branch named develop 