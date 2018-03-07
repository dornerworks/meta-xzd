# Need to add this line, so that generated yaml file isn't empty.  There is a bug in
# meta-xilinx-tools that causes a failure in device-tree-generation when the yaml file is empty.
YAML_MAIN_MEMORY_CONFIG_zynqmp = "psu_ddr_0"


do_deploy_append() {
    mkdir -p ${DEPLOYDIR}/dtg
    install -m 0644 ${DEVICETREE_WORKDIR}/*.dtsi ${DEPLOYDIR}/dtg/    
    install -m 0644 ${DEVICETREE_WORKDIR}/system-top.dts ${DEPLOYDIR}/dtg/    
}