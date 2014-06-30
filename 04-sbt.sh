#!/bin/bash

# custamize variable
readonly DOWNLOAD_SRC='http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.zip'
readonly WORK_DIR="${HOME}/sbt.install"
readonly LIB_PATH="/opt"
readonly BIN_PATH="/usr/bin"

# ===== do not touch =====
readonly ZIP_FILE="sbt.zip"

CHECK() {
    "$@" 2>&1 | tee -a ${WORK_DIR}/install-log
    [ "`echo ${PIPESTATUS[@]} | tr -d '0 '`" ] && exit 1;
}

type sbt && exit 0;

mkdir -p ${WORK_DIR}
CHECK wget -O ${WORK_DIR}/${ZIP_FILE} ${DOWNLOAD_SRC}
CHECK sudo unzip -o -d ${LIB_PATH} ${WORK_DIR}/${ZIP_FILE}

CHECK sudo chmod 755 ${LIB_PATH}/sbt/bin/sbt
CHECK sudo ln -s ${LIB_PATH}/sbt/bin/sbt ${BIN_PATH}

rm -fr ${WORK_DIR}

exit 0;

# end of file
