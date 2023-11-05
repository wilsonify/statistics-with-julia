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