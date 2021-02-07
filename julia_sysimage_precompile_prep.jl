import Pkg

Pkg.add("PackageCompiler")
Pkg.add("Plots")
Pkg.add("OhMyREPL")
Pkg.add("DataFrames")
Pkg.add("DataFramesMeta")
Pkg.add("Chain")
Pkg.add("Statistics")
Pkg.update()

using PackageCompiler
using OhMyREPL
using Plots
using Statistics
using DataFrames
using DataFramesMeta
using Chain

1+1 # OhMyREPL
plot(1:10, rand(10)) # Plots

# DataFrames, DataFramesMeta, Chain
df = DataFrames.DataFrame(x=["a", "a", "b", "b"], y=[1,2,3,4])
@chain df begin
    groupby(:x)
    combine(:y => mean => :weight_mean)
end

