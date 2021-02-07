import Pkg

# Add the packages you want to precompile
Pkg.add("PackageCompiler")
Pkg.add("Plots")
Pkg.add("OhMyREPL")
Pkg.add("DataFrames")
Pkg.add("DataFramesMeta")
Pkg.add("Chain")
Pkg.add("Statistics")
Pkg.update() # Make sure they're up to date.

# Open them up
using PackageCompiler
using OhMyREPL
using Plots
using Statistics
using DataFrames
using DataFramesMeta
using Chain

# You need to use a function from each package once to trigger compilation.
1+1 # OhMyREPL
plot(1:10, rand(10)) # Plots

# DataFrames, DataFramesMeta, Chain, Statistics
df = DataFrames.DataFrame(x=["a", "a", "b", "b"], y=[1,2,3,4])
@chain df begin
    groupby(:x)
    combine(:y => mean => :weight_mean)
end

