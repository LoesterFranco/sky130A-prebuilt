PDK_BASE=$1
PDK_ROOT=$2

#Adding skywater licenses
for d in $PDK_ROOT/sky130A/libs.ref/*/; do cp $PDK_BASE/license/skywater_license "$d"/gds/LICENSE; done
for d in $PDK_ROOT/sky130A/libs.ref/*/; do cp $PDK_BASE/license/skywater_license "$d"/lib/LICENSE; done
for d in $PDK_ROOT/sky130A/libs.ref/*/; do cp $PDK_BASE/license/skywater_license "$d"/mag/LICENSE; done
for d in $PDK_ROOT/sky130A/libs.ref/*/; do cp $PDK_BASE/license/skywater_license "$d"/maglef/LICENSE; done
for d in $PDK_ROOT/sky130A/libs.ref/*/; do cp $PDK_BASE/license/skywater_license "$d"/LICENSE; done


# Adding Open PDKs licenses
for d in $PDK_ROOT/sky130A/libs.tech/*/; do cp $PDK_BASE/license/open_pdks_license "$d"/LICENSE; done
cp $PDK_BASE/license/open_pdks_license $PDK_ROOT/sky130A/libs.tech/LICENSE

