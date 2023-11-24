
function install_julia(major,minor,patch) {
  major_minor=$major.$minor
  full_version=$major.$minor.$patch
  wget https://julialang-s3.julialang.org/bin/linux/x64/$major_minor/julia-$full_version-linux-x86_64.tar.gz
  tar -xvzf julia-$full_version-linux-x86_64.tar.gz
  mkdir -p /opt/julia/v$full_version
  mv julia-$full_version/* /opt/julia/v$full_version
  update-alternatives --install /usr/bin/julia julia /opt/julia/v$full_version/bin/julia 100
  rmdir julia-$full_version
  rm -f julia-$full_version-linux-x86_64.tar.gz
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    install_julia($1,$2,$3)
fi
