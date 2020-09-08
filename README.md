[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

# Sources:

This repo is a prebuilt version of the [skywater-pdk](https://github.com/google/skywater-pdk) using [open_pdks](https://github.com/RTimothyEdwards/open_pdks), mainly for the use of [OpenLANE](https://github.com/efabless/openlane/tree/master).

- The used commit from skywater-pdk is [8de719a7bb445bf56a6f1fe11db162ccc783f37d](https://github.com/google/skywater-pdk/commit/8de719a7bb445bf56a6f1fe11db162ccc783f37d)
- The used commit from open_pdks is [52f78fa08f91503e0cff238979db4589e6187fdf](https://github.com/RTimothyEdwards/open_pdks/commit/52f78fa08f91503e0cff238979db4589e6187fdf)

# How to use:

You should create a symbolic link from this folder to /pdk
```bash
    export PDK_BASE==<absolute path to this repo local path>
    ln -s $PDK_BASE /pdks
    export PDK_ROOT=/pdks
```
Then use `$PDK_ROOT` as the absolute path where the pdk resides.


# Recreating the PDK:

To recreate the PDK, run:

```bash
export PDK_BASE==<absolute path to this repo local path>
ln -s $PDK_BASE /pdks
export PDK_ROOT=/pdks
make
```
