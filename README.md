

Julia allows you to pre-compile Julia system images with specific packages so that you don't incur the compilation hit every time you use those packages. 

See an example here: 
https://julialang.github.io/PackageCompiler.jl/dev/examples/ohmyrepl/

If you want to have a Julia image that includes your commonly used packages, this shows you how to do it. 

## Step 1: Run the ZSH file

The ZSH script resets the Julia image to the default, updates all packages, and then runs the required code to precompile the packages into a new system image. 

```zsh
~ ZSH ~/src/julia_precompile/julia_sysimage_precompile.zsh
```

## Setup a CLI alias to use the precompiled julia image
If you use ZSH as your CLI, add the following alias to your .zshrc file to be able to call the precompiled version directly. 

```zsh
~ alias juliapc="julia --sysimage ~/src/julia_precompile/julia_plus.so"
```

## Look at speed-ups
The code below is super simple, but shows that the precompiled calls are faster. 

```zsh
# Regular Julia
~ time julia src/julia_precompile/compiled_julia_test.jl

# Precompiled Julia
~ time juliapc src/julia_precompile/compiled_julia_test.jl
```

## Make it daily

Add to crontab

```crontab
0 06 * * *  ZSH ~/src/julia_precompile/julia_sysimage_precompile.zsh >> ~/src/julia_precompile/julia_precompile.log 2>&1
```