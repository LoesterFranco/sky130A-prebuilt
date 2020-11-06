[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

# What is this repo?

This repo is a prebuilt version of the [skywater-pdk](https://github.com/google/skywater-pdk) using [open_pdks](https://github.com/RTimothyEdwards/open_pdks). It is structured to work with [OpenLANE](https://github.com/efabless/openlane/tree/master), but could be used by other open-source tools.

# Prerequisites:

- [git-lfs](https://git-lfs.github.com/): You must download and install git-lfs from [here](https://git-lfs.github.com/), then initialize it with the following command:

```bash
	git lfs install
```

## Impotrant Note
* This repository is a submodule of OpenLANE. If you installed/cloned OpenLANE recursively you "do not" need to come here at all.

* You must install git-lfs on you environement before you start the installation step below. If you do not install and initialize git-lfs, the installation will not be complete and ready for use with design tools such as OpenLANE.

* git-lfs initialization is user-specific step. The host does not initialize it for every user.

# Sources:

This repository contains data from two specific repositories and specific hashes.

- The used commit from skywater-pdk is [bd7b0f6a274a4cec839023a5b94b5b216a8d9231](https://github.com/google/skywater-pdk/commit/bd7b0f6a274a4cec839023a5b94b5b216a8d9231)
- The used commit from open_pdks is [48db3e1a428ae16f5d4c86e0b7679656cf8afe3d](https://github.com/RTimothyEdwards/open_pdks/commit/48db3e1a428ae16f5d4c86e0b7679656cf8afe3d)

# PDK Installation - for designers:

```bash
	git clone https://github.com/efabless/sky130A-prebuilt.git
	cd sky130A-prebuilt
	make link
	export PDK_ROOT=/tmp/pdks
```
You can now use $PDK_ROOT as the location where the pdk resides.

# PDK Update - for developers:

## Prerequisites:

 - python3
 - [magic](https://github.com/RTimothyEdwards/magic) - At least version 8.3.60 is required

## How To Re-build/Update:

First, select the [skywater-pdk](https://github.com/google/skywater-pdk) and [open_pdks](https://github.com/RTimothyEdwards/open_pdks) commit hashes you want to use, and set them using the following commands:
```bash
	export SKYWATER_COMMIT=<a valid skywater-pdk repository commit hash>
	export OPEN_PDKS_COMMIT=<a valid open_pdks repository commit hash>
```

Then, run the following command, after installing the prerequisites
```bash
	make
```

