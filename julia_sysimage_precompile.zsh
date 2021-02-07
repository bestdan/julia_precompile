#!/bin/zsh
emulate -LR zsh
PATH=/bin:/usr/bin:/usr/local/bin
export PATH

# Restore default ahead of time to not re-use compiled version
julia -e 'using PackageCompiler; PackageCompiler.restore_default_sysimage();'

# Define the image
julia --trace-compile=julia_sysimage_precompile_data.jl julia_sysimage_precompile_prep.jl 

# Compile the image
julia -e 'using PackageCompiler; PackageCompiler.create_sysimage([:Plots, :OhMyREPL, :DataFrames, :DataFramesMeta, :Chain, :Statistics]; sysimage_path="julia_plus.so", precompile_statements_file="julia_sysimage_precompile_data.jl");'