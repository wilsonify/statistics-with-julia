
based on 
Statistics with Julia: Fundamentals for Data Science, Machine Learning and Artificial Intelligence
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
julia_major_version=1
julia_minor_version=7
julia_patch_version=3
major_minor=$julia_major_version.$julia_minor_version
full_version=$julia_major_version.$julia_minor_version.$julia_patch_version
wget https://julialang-s3.julialang.org/bin/linux/x64/$major_minor/julia-$full_version-linux-x86_64.tar.gz
tar -xvzf julia-$full_version-linux-x86_64.tar.gz
mkdir -p /opt/julia/v$full_version
mv julia-$full_version/* /opt/julia/v$full_version
update-alternatives --install /usr/bin/julia julia /opt/julia/v$full_version/bin/julia 100
rmdir julia-$full_version
rm -f julia-$full_version-linux-x86_64.tar.gz
```

#### Install Python > 3.9


#### Install python libraries

```
pip install -r src/c01_CallPython/requirements.txt
```

#### Install Julia Packages
    
```
julia --project="~/.julia/environments/StatsWithJulia1.7" setup.jl
```

#### Run Tests

```
julia --project="~/.julia/environments/StatsWithJulia1.7" test/runtests.jl
```

# Contribute

1. Open an Issue
2. Create a Fork
3. Submit a Pull Request into the branch named develop 