#!/bin/sh

NAND_SIZE="3862528"
OUTPUT_DUMP_FILE_NAME="nand.img"
sudo ./ingenic-boot --dump=${OUTPUT_DUMP_FILE_NAME}@${NAND_SIZE}
