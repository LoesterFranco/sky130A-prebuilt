[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

# Prerequisites:

- [git-lfs](https://git-lfs.github.com/): You must download and install git-lfs from [here](https://git-lfs.github.com/), then set it up once per user account by running the following command:

```bash
git lfs install
```

# Sources:

This repo is a prebuilt version of the [skywater-pdk](https://github.com/google/skywater-pdk) using [open_pdks](https://github.com/RTimothyEdwards/open_pdks), mainly for the use of [OpenLANE](https://github.com/efabless/openlane/tree/master).

- The used commit from skywater-pdk is [bd7b0f6a274a4cec839023a5b94b5b216a8d9231](https://github.com/google/skywater-pdk/commit/bd7b0f6a274a4cec839023a5b94b5b216a8d9231)
- The used commit from open_pdks is [48db3e1a428ae16f5d4c86e0b7679656cf8afe3d](https://github.com/RTimothyEdwards/open_pdks/commit/48db3e1a428ae16f5d4c86e0b7679656cf8afe3d)

# How to use:

You should create a symbolic link from this folder to /pdk
```bash
	make link
```
Then use `$PDK_ROOT` as the absolute path where the pdk resides.


# Recreating the PDK:

To recreate the PDK, run:

```bash
	make
```

# Prerequisites to recreate:

 - python3
 - [magic](https://github.com/RTimothyEdwards/magic) - At least version 8.3.25 is required
