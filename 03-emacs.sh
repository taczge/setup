#!/bin/sh

readonly LATEST_VERSION="24.3"
readonly APT_GET="sudo apt-get install -y"

install_emacs() {
    readonly working_dir="$HOME/emacs.install"
    readonly source_path="http://ftp.gnu.org/pub/gnu/emacs/emacs-${LATEST_VERSION}.tar.gz"
    readonly log_file_name="install.log"

    log_file_path=$working_dir/$log_file_name

    wget $source_path -P $working_dir
    cd $working_dir
    tar xzvf `basename $source_path`

    $APT_GET libgtk2.0-dev libXpm-dev libjpeg-dev \
        libgif-dev libtiff4-dev libncurses5-dev 2>&1 | tee -a $log_file_path

    unpacking_dir=$working_dir/`basename $source_path`
    cd `echo $unpacking_dir | sed 's/\.tar\.gz//g'`
    ./configure 2>&1 | tee -a $log_file_path
    make 2>&1 | tee -a $log_file_path
    sudo make install 2>&1 | tee -a $log_file_path

    rm -fr $working_dir
}

install_apel() {
    PACKAGE="apel"

    if paco -a | grep $PACKAGE > /dev/null ; then
        echo "[skipped] $PACKAGE already exists."
        return 0;
    fi

    echo "[install] start installing $PACKAGE."

    EMACS_VERSION=`emacs -version | head -1 | sed 's/.*\([0-9][0-9]\.[0-9]\).*/\1/g'`
    WORK_DIR="$HOME/$PACKAGE.install"

    mkdir $WORK_DIR
    cd $WORK_DIR

    git clone https://github.com/wanderlust/apel.git
    cd apel
    sudo paco -lD "make install EMACS=emacs-$EMACS_VERSION"
}

install_flim() {
    PACKAGE="flim"

    if paco -a | grep $PACKAGE > /dev/null ; then
        echo "[skipped] $PACKAGE already exists."
        return 0;
    fi

    echo "[install] start installing $PACKAGE."

    EMACS_VERSION=`emacs -version | head -1 | sed 's/.*\([0-9][0-9]\.[0-9]\).*/\1/g'`
    WORK_DIR="$HOME/$PACKAGE.install"

    mkdir $WORK_DIR
    cd $WORK_DIR

    git clone https://github.com/wanderlust/flim.git
    cd flim
    sudo paco -lD "make install EMACS=emacs-$EMACS_VERSION"
}

install_semi() {
    PACKAGE="semi"

    if paco -a | grep $PACKAGE > /dev/null ; then
        echo "[skipped] $PACKAGE already exists."
        return 0;
    fi

    echo "[install] start installing $PACKAGE."

    EMACS_VERSION=`emacs -version | head -1 | sed 's/.*\([0-9][0-9]\.[0-9]\).*/\1/g'`
    WORK_DIR="$HOME/$PACKAGE.install"

    mkdir $WORK_DIR
    cd $WORK_DIR

    git clone https://github.com/wanderlust/semi.git
    cd semi
    sudo paco -lD "make install EMACS=emacs-$EMACS_VERSION"
}

exists_latest_emacs() {
    readonly EXIST="0"
    readonly NOT_EXIST="1"

    if [ -z "`which emacs`" ] ; then
        echo "[install] This system does not have emacs."
        return $NOT_EXIST
    fi

    EMACS_VERSION_ON_SYSTEM="`emacs -version | head -1 | grep "$LATEST_VERSION"`"
    if [ -z "$EMACS_VERSION_ON_SYSTEM" ] ; then
        echo "[install] This system does not have latest version."
        return $NOT_EXIST
    else
        echo "[skipped]: This system has latest version emacs."
        return $EXIST
    fi
}

#
# main
#
if ! exists_latest_emacs ; then
    install_emacs
fi

install_apel
install_flim
install_semi

$APT_GET w3m-el-snapshot
$APT_GET gnutls-bin

# end of file
