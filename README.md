[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

# What is this repo?

This repo is a prebuilt version of the [skywater-pdk](https://github.com/google/skywater-pdk) using [open_pdks](https://github.com/RTimothyEdwards/open_pdks). It is structured to work with [OpenLANE](https://github.com/efabless/openlane/tree/master).

# Prerequisites:

- [git-lfs](https://git-lfs.github.com/): You must download and install git-lfs from [here](https://git-lfs.github.com/), then initialize it with the following command:

```bash
	git lfs install
```

## Impotrant Note
* This repository is a submodiule of OpenLANE. If you installed / cloned OpenLANE recursively you "do not" need to come here at all.

* You must install git-lfs on you environement before you start the installation step below. If you do not install and initialize git-lfs, the installation will not be complete and ready for use with design tools such as OpenLANE.

* git-lfs initialization is user-spcecific step. Installing git-lfs the host does not initialize it for every user.

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
and you are done

# PDK Update - for developers:

## Prerequisites:

 - python3
 - [magic](https://github.com/RTimothyEdwards/magic) - At least version 8.3.25 is required

## Prerequisites:

#TODO - update the make fule to have an update option with hash selection for skywater-pdk and open_pdks

To recreate the PDK, run:

```bash
	make
```

