# Copyright 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
MAKE_ROOT ?= $(shell pwd)
PDK_ROOT ?= /pdks
THREADS ?= $(shell nproc)
STD_CELL_LIBRARY ?= sky130_fd_sc_hd

SKYWATER_COMMIT ?= 8de719a7bb445bf56a6f1fe11db162ccc783f37d
OPEN_PDKS_COMMIT ?= 52f78fa08f91503e0cff238979db4589e6187fdf

.DEFAULT_GOAL := all

.PHONY: all

all: pdk

pdk: skywater-pdk open_pdks clear

skywater-pdk: clone-skywater-pdk all-skywater-libraries

clone-skywater-pdk: check-env
	cd  $(PDK_ROOT) && \
		rm -rf skywater-pdk && \
		git clone https://github.com/google/skywater-pdk.git skywater-pdk && \
		cd skywater-pdk && \
	    git checkout -qf $(SKYWATER_COMMIT)	&& \
		cd $(MAKE_ROOT) && \
		python3 autoCommitUpdate.py -s $(SKYWATER_COMMIT) -m $(MAKE_ROOT)/Makefile -r $(MAKE_ROOT)/README.md
	

skywater-library: check-env
	cd  $(PDK_ROOT)/skywater-pdk && \
		git submodule update --init libraries/$(STD_CELL_LIBRARY)/latest && \
		make -j$(THREADS) $(STD_CELL_LIBRARY)

all-skywater-libraries: check-env
	cd  $(PDK_ROOT)/skywater-pdk && \
		git submodule update --init libraries/sky130_fd_sc_hd/latest && \
		git submodule update --init libraries/sky130_fd_sc_hs/latest && \
		git submodule update --init libraries/sky130_fd_sc_hdll/latest && \
		git submodule update --init libraries/sky130_fd_sc_ms/latest && \
		git submodule update --init libraries/sky130_fd_sc_ls/latest && \
		make -j$(THREADS) timing

open_pdks: clone-open_pdks install-open_pdks

clone-open_pdks: check-env
	cd $(PDK_ROOT) && \
		rm -rf open_pdks && \
		git clone https://github.com/RTimothyEdwards/open_pdks.git open_pdks && \
		cd open_pdks && \
	    git checkout -qf $(OPEN_PDKS_COMMIT) && \
		cd $(MAKE_ROOT) && \
		python3 autoCommitUpdate.py -o $(OPEN_PDKS_COMMIT) -m $(MAKE_ROOT)/Makefile -r $(MAKE_ROOT)/README.md
	

install-open_pdks: check-env
	cd $(PDK_ROOT)/open_pdks && \
		./configure --with-sky130-source=$(PDK_ROOT)/skywater-pdk/libraries --with-sky130-local-path=$(PDK_ROOT) && \
		cd sky130 && \
		make && \
		make install-local

update-commits:
	cd $(MAKE_ROOT) && \
		python3 autoCommitUpdate.py -s $(SKYWATER_COMMIT) -o $(OPEN_PDKS_COMMIT) -m $(MAKE_ROOT)/Makefile -r $(MAKE_ROOT)/README.md


clear: check-env
	cd $(PDK_ROOT) && \
		rm -rf open_pdks && \
		rm -rf skywater-pdk

clean: check-env clear 
	cd $(PDK_ROOT) && \
		rm -rf sky130A

check-env:
ifndef PDK_ROOT
	$(error PDK_ROOT is undefined, please export it before running make)
endif
