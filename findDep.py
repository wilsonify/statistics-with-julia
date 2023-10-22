import glob


def get_deps_from_dirname(chdir):
    deps_set = set([])
    for f in glob.glob(f"{chdir}/*.jl"):
        print(f)
        for line in open(f, 'r'):
            if line.startswith("using "):
                print(line)
                line = line.replace("using ", "")
                line = line.replace(";", ",")
                for dep in line.split(","):
                    dep = dep.strip()
                    dep = dep.replace("pyplot()", "PyPlot")
                    print(f"dep={dep}")
                    deps_set.add(dep)
    return deps_set


def read_deps_list(deps):
    for d in deps:
        print(f"Pkg.add(\"{d}\")")


def main():
    deps_list = list(get_deps_from_dirname("."))
    read_deps_list(deps_list)

    deps_list = list(get_deps_from_dirname("c04_data"))
    read_deps_list(deps_list)


if __name__ == "__main__":
    main()
