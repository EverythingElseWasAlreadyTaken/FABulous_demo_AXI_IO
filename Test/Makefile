MAX_BITBYTES=16384
FAB_PROJ_ROOT=..
BUILD_DIR=build
YOSYS?=$(or $(FAB_YOSYS_PATH),yosys)
NEXTPNR?=$(or $(FAB_NEXTPNR_PATH),nextpnr-generic)
DESIGN=axi_io_test
TESTBENCH=${DESIGN}_tb
TOP_WRAPPER=top_wrapper

FABRIC_FILES_DIR=${BUILD_DIR}/fabric_files
USER_DESIGN_DIR=${FAB_PROJ_ROOT}/user_design
USER_DESIGN_VERILOG=${USER_DESIGN_DIR}/${DESIGN}.v
# A design may ship its own hand-wired wrapper as <design>_wrapper.v; the
# generated default top_wrapper.v only auto-connects the demo counter design.
TOP_WRAPPER_SRC?=$(if $(wildcard ${USER_DESIGN_DIR}/${DESIGN}_wrapper.v),${DESIGN}_wrapper,${TOP_WRAPPER})
TOP_WRAPPER_VERILOG=${USER_DESIGN_DIR}/${TOP_WRAPPER_SRC}.v
WAVEFORM_TYPE=fst

VVP_ARGS=+output_waveform=${BUILD_DIR}/${DESIGN}.${WAVEFORM_TYPE}
VVP_ARGS+=+bitstream_hex=${BUILD_DIR}/${DESIGN}.hex
ifeq ($(WAVEFORM_TYPE),fst)
    VVP_ARGS+=-fst
endif

#only add if custom_prims.v exists
ifneq ($(wildcard ${USER_DESIGN_DIR}/custom_prims.v),)
		CUSTOM_PRIMS=-extra-plib ${USER_DESIGN_DIR}/custom_prims.v
endif

.PHONY: all run_FABulous_demo full build_test_design run_simulation_emulation mkdir_build clean FAB_sim build_demo_fabric test_npu_act_row test_npu_io

sim: build_test_design run_simulation

FAB_sim: build_demo_fabric build_test_design run_simulation

full_sim: run_FABulous_demo build_test_design run_simulation_emulation clean

build_test_design: run_yosys run_nextpnr run_bitgen copy_files

run_simulation_emulation: run_emulation run_simulation

run_FABulous_demo:
	# Runs FABulous, generates the default fabric and generates a bitstream from the default user_design.
	# Create build folders, since FABulous removes them after it runs its simulation.
	FABulous ${FAB_PROJ_ROOT} -fs ${FAB_PROJ_ROOT}/FABulous.tcl
	mkdir -p ${BUILD_DIR}
	mkdir -p ${FABRIC_FILES_DIR}
	mv -f ${DESIGN}.hex ${BUILD_DIR}/
	mv -f ${DESIGN}.fst ${BUILD_DIR}/
	cp -fu ${USER_DESIGN_DIR}/* ${BUILD_DIR}

build_demo_fabric: mkdir_build
	# Builds the default fabric
	FABulous ${FAB_PROJ_ROOT} -ts ./build_fabulous_fabric.tcl

run_yosys: mkdir_build
	${YOSYS} -p "synth_fabulous -top ${TOP_WRAPPER} -json ${BUILD_DIR}/${DESIGN}.json ${CUSTOM_PRIMS}" ${USER_DESIGN_VERILOG} ${TOP_WRAPPER_VERILOG}

run_nextpnr: mkdir_build
	FAB_ROOT=${FAB_PROJ_ROOT} ${NEXTPNR} --uarch fabulous --json ${BUILD_DIR}/${DESIGN}.json -o fasm=${BUILD_DIR}/${DESIGN}.fasm

run_bitgen: mkdir_build
	bit_gen -genBitstream ${BUILD_DIR}/${DESIGN}.fasm ${FAB_PROJ_ROOT}/.FABulous/bitStreamSpec.bin ${BUILD_DIR}/${DESIGN}.bin
	python3 makehex.py ${BUILD_DIR}/${DESIGN}.bin ${MAX_BITBYTES} ${BUILD_DIR}/${DESIGN}.hex

copy_files: mkdir_build
	find ${FAB_PROJ_ROOT}/Tile/ -name '*.v' -type f -exec cp {} ${FABRIC_FILES_DIR}/ \;
	find ${FAB_PROJ_ROOT}/Fabric/ -name '*.v' -type f -exec cp {} ${FABRIC_FILES_DIR}/ \;

mkdir_build:
	mkdir -p ${BUILD_DIR}
	mkdir -p ${FABRIC_FILES_DIR}

run_simulation:
	iverilog -g2012 -s ${TESTBENCH} -o ${BUILD_DIR}/${DESIGN}.vvp ${FABRIC_FILES_DIR}/* ${USER_DESIGN_VERILOG} ${TESTBENCH}.v
	vvp ${BUILD_DIR}/${DESIGN}.vvp ${VVP_ARGS}

run_emulation:
	iverilog -g2012 -D EMULATION -s ${TESTBENCH} -o ${BUILD_DIR}/${DESIGN}.vvp ${BUILD_DIR}/${DESIGN}.vh ${FABRIC_FILES_DIR}/* ${USER_DESIGN_VERILOG} ${TESTBENCH}.v
	vvp ${BUILD_DIR}/${DESIGN}.vvp ${VVP_ARGS}

run_GTKWave:
	gtkwave ${BUILD_DIR}/${DESIGN}.${WAVEFORM_TYPE}

clean:
	rm -rf ${BUILD_DIR}

# Standalone BEL-level check for the NPU_ACT_ROW tile primitive.
# Needs no bitstream, so it runs without the full synth/P&R flow.
NPU_ACT_ROW_TB=npu_act_row_tb
test_npu_act_row: mkdir_build
	iverilog -g2012 -s ${NPU_ACT_ROW_TB} -o ${BUILD_DIR}/${NPU_ACT_ROW_TB}.vvp \
		${FAB_PROJ_ROOT}/Tile/NPU_ACT_ROW/NPU_ACT_ROW_BEL.v ${NPU_ACT_ROW_TB}.v
	vvp ${BUILD_DIR}/${NPU_ACT_ROW_TB}.vvp

# Full-fabric basic-IO test for the NPU_ACT_ROW column: synthesises
# npu_io_test into the fabric and checks every NPU pin against the counter.
test_npu_io:
	${MAKE} DESIGN=npu_io_test sim
