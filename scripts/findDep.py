import glob
import os.path

path_to_here = os.path.abspath(os.path.dirname(__file__))
path_to_there = os.path.abspath(f"{path_to_here}/..")


def get_deps_from_dirname(chdir):
    print("get_deps_from_dirname")
    print(f"chdir = {chdir}")
    deps_set = set([])
    for f in glob.glob(f"{chdir}/*.jl"):
        for line in open(f, 'r'):
            if line.startswith("using "):
                line = line.replace("using ", "")
                line = line.replace(";", ",")
                for dep in line.split(","):
                    dep = dep.strip()
                    dep = dep.replace("pyplot()", "PyPlot")
                    # "Base.Iterators: repeated"
                    # "Flux: onehotbatch"

                    deps_set.add(dep)
    return deps_set


def read_deps_list(deps):
    for d in deps:
        print(f"Pkg.add(\"{d}\")")


def main():
    deps_list = list(get_deps_from_dirname(path_to_there))
    read_deps_list(deps_list)

    c01_intro_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c01_intro"))
    read_deps_list(c01_intro_deps_list)
    c02_probability_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c02_probability"))
    read_deps_list(c02_probability_deps_list)
    c03_distribution_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c03_distribution"))
    read_deps_list(c03_distribution_deps_list)
    c04_data_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c04_data"))
    read_deps_list(c04_data_deps_list)
    c05_inference_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c05_inference"))
    read_deps_list(c05_inference_deps_list)
    c06_confidence_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c06_confidence"))
    read_deps_list(c06_confidence_deps_list)
    c07_hypothesis_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c07_hypothesis"))
    read_deps_list(c07_hypothesis_deps_list)
    c08_regression_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c08_regression"))
    read_deps_list(c08_regression_deps_list)
    c09_machine_learning_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c09_machine_learning"))
    read_deps_list(c09_machine_learning_deps_list)
    c10_simulation_deps_list = list(get_deps_from_dirname(f"{path_to_there}/c10_simulation"))
    read_deps_list(c10_simulation_deps_list)


if __name__ == "__main__":
    main()
