PDK_ROOT ?= /pdk
THREADS ?= 8
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
	    git checkout -qf $(SKYWATER_COMMIT)	

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
	    git checkout -qf $(OPEN_PDKS_COMMIT)	

install-open_pdks: check-env
	cd $(PDK_ROOT)/open_pdks && \
		./configure --with-sky130-source=$(PDK_ROOT)/skywater-pdk/libraries --with-sky130-local-path=$(PDK_ROOT) && \
		cd sky130 && \
		make && \
		make install-local

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