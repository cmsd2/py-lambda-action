#!/bin/bash

build_zip(){
	echo "Installing and zipping dependencies..."
	OUT_FILE=`realpath "${INPUT_OUT_FILE}"`
	CODE_DIR=`realpath "${INPUT_CODE_DIR}"`
	OUT_DIR="python"

	rm "${OUT_FILE}"

	pip install --target="${OUT_DIR}" -r "${INPUT_REQUIREMENTS_TXT}"
	cd "${CODE_DIR}/${OUT_DIR}"
	zip -r "${OUT_FILE}" "."

	echo "Zipping the code..."
	cd "${CODE_DIR}"
	zip -r "${OUT_FILE}" . -x \*.git\* "${OUT_DIR}"
}

build_zip
echo "Done."
