#!/bin/zsh
emulate -LR zsh
PATH=/bin:/usr/bin:/usr/local/bin
export PATH

# If needed, testore default ahead of time to not re-use compiled version
# julia -e 'using PackageCompiler; PackageCompiler.restore_default_sysimage();'

pushd ~/src/julia_precompile

# Compile the image
julia -e 'using PackageCompiler; PackageCompiler.create_sysimage([:Plots, :OhMyREPL, :DataFrames, :DataFramesMeta, :Chain, :Statistics]; sysimage_path="julia_plus.so", precompile_execution_file="compiled_julia_test.jl");'

popd
