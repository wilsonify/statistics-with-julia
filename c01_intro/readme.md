
Julia is a programming language that aims to strike a balance between development speed and runtime speed. 

It is designed to be a high-level, high-performance language for technical computing. 

Julia's creators have focused on achieving both fast development and fast runtime performance. 

It's often described as having the best of both worlds, 
combining the ease of use and expressiveness of languages like Python, R, or MATLAB 
with the speed and efficiency of low-level languages like C or Fortran.


## Development Speed: 

Julia is known for its simplicity and expressive syntax, 
making it relatively easy and quick to write code. 

Its dynamic typing, high-level abstractions, 
and powerful metaprogramming capabilities contribute to faster development times.

## Runtime Speed: 

Julia is designed to be as fast as low-level languages like C or Fortran. 

Julia's Just-In-Time (JIT) compilation and type system optimizations allow it to achieve close-to-C performance. 

Julia's core libraries and numerical computing packages are often implemented in Julia itself,
which contributes to its impressive runtime performance.

In summary, 
Julia is positioned in a way that it aims to offer 
fast development speed similar to high-level languages while providing 
runtime performance comparable to low-level languages. 

This makes it a valuable choice for scientific computing, 
data analysis, and other fields where both fast development and runtime performance are essential. 

Julia's ability to seamlessly call C and Fortran libraries 
also means that you can optimize specific parts of your code for even greater runtime performance when needed.


Julia has environments built into its package manager|

1. Enter the REPL

```
julia 
]
```

2. activate the environment

```
activate
```

3. instantiate to install packages

```

```

To return to the julia> prompt press backspace or press Ctrl+C.

| command             | description                                                                        | 
|---------------------|------------------------------------------------------------------------------------|
| activate            | set the primary environment the package manager manipulates                        |
| add                 | add packages to project                                                            |
| build               | run the build script for packages                                                  |
| develop, dev        | clone the full package repo locally for development                                |
| free                | undoes a pin, develop, or stops tracking a repo                                    |
| gc                  | garbage collect packages not used for a significant time                           |
| generate            | generate files for a new project                                                   |
| instantiate         | downloads all the dependencies for the project                                     |
| pin                 | pins the version of packages                                                       |
| precompile          | precompile all the project dependencies                                            |
| redo                | redo the latest change to the active project                                       |
| remove, rm          | remove packages from project or manifest                                           |
| resolve             | resolves to update the manifest from changes in dependencies of developed packages |
| status, st          | summarize contents of and changes to environment                                   |
| test                | run tests for packages                                                             |
| undo                | undo the latest change to the active project                                       |
| update, up          | update packages in manifest                                                        |
| registry add        | add package registries                                                             |
| registry remove, rm | remove package registries                                                          |
| registry status, st | information about installed registries                                             |
| registry update, up | update package registries                                                          |