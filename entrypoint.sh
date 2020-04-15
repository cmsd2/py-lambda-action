#!/bin/bash

build_zip(){
	echo "Installing and zipping dependencies..."
	OUT_FILE=`realpath "${INPUT_OUT_FILE}"`
	CODE_DIR=`realpath "${INPUT_CODE_DIR}"`
	PYTHON="python3.6"

	test -f "${OUT_FILE}" && rm "${OUT_FILE}"

	cd "${CODE_DIR}"
	pipenv install -r "${INPUT_REQUIREMENTS_TXT}"
	VENV_DIR=`pipenv --venv`
	LIB_SITE_PACKAGES="${VENV_DIR}/lib/${PYTHON}/site-packages"
	LIB64_SITE_PACKAGES="${VENV_DIR}/lib64/${PYTHON}/site-packages"
	LIB_DIST_PACKAGES="${VENV_DIR}/lib/${PYTHON}/dist-packages"
	LIB64_DIST_PACKAGES="${VENV_DIR}/lib64/${PYTHON}/dist-packages"
	
	test -d "${LIB_SITE_PACKAGES}" && cd "${LIB_SITE_PACKAGES}" && zip -r "${OUT_FILE}" "."
	test -d "${LIB64_SITE_PACKAGES}" && cd "${LIB64_SITE_PACKAGES}" && zip -r "${OUT_FILE}" "."
	test -d "${LIB_DIST_PACKAGES}" && cd "${LIB_DIST_PACKAGES}" && zip -r "${OUT_FILE}" "."
	test -d "${LIB64_DIST_PACKAGES}" && cd "${LIB64_DIST_PACKAGES}" && zip -r "${OUT_FILE}" "."

	echo "Zipping the code..."
	cd "${CODE_DIR}"
	zip -r "${OUT_FILE}" . -x \*.git\*
}

build_zip
echo "Done."
