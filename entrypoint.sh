#!/bin/bash

build_zip(){
	echo "Installing and zipping dependencies..."
	OUT_FILE=`realpath "${INPUT_OUT_FILE}"`
	CODE_DIR=`realpath "${INPUT_CODE_DIR}"`
	rm "${OUT_FILE}"
	mkdir -p "${INPUT_OUT_DIR}"
	pip install --target="${INPUT_OUT_DIR}" -r "${INPUT_REQUIREMENTS_TXT}"
	cd "${INPUT_OUT_DIR}"
	zip -r "${OUT_FILE}" "."
	echo "Zipping the code..."
	cd "${CODE_DIR}"
	zip -r "${OUT_FILE}" . -x \*.git\*
}

build_zip
echo "Done."
