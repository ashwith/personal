#!/bin/bash
set -e
#==============================================================================
#		                 EDA Tools
#==============================================================================

mkdir eda_setup
cd eda_setup
mkdir -p $HOME/icdesign/tools

RUN_DIR=$(pwd)
INSTALL_DIR=$HOME/icdesign
TOOLS_DIR=$INSTALL_DIR/tools
PDK_DIR=$INSTALL_DIR/pdk
LIB_DIR=$INSTALL_DIR/lib
# Dependencies
echo "=============================================="
echo "Installing Dependences, Octave, Scilab, Maxima"
echo "=============================================="
sudo apt update
sudo apt install -y libx11-dev libxrender-dev libx11-xcb-dev\
	libcairo2-dev tcl8.6-dev tk8.6-dev bison flex\
	libxpm-dev xterm vim-gtk3 tcl-tclreadline libjpeg-dev\
	libgtk-3-dev build-essential tcl-dev tk-dev libcairo-dev\
	autotools-dev automake libxt-dev libtool libxaw7-dev\
	libreadline-dev libfftw3-dev mesa-common-dev libglu1-mesa-dev\
	ruby ruby-dev python3 python3-dev libz-dev qmake6 qt6-base-dev\
	qt6-multimedia-dev qt6-svg-dev libqt6core5compat6 libqt6designer6\
	mpi-default-dev cmake trilinos-all-dev trilinos-dev\
	ninja-build libblas3 libblas64-3 libblas-dev libblas64-dev\
	liblapack3 liblapack64-3 liblapack-dev liblapack64-dev\
	scilab octave octave-control octave-doc octave-general\
	octave-linear-algebra octave-secs1d octave-secs2d octave-secs3d\
	octave-splines octave-symbolic maxima maxima-doc maxima-share\
	wxmaxima python-is-python3 2to3 python3.11-venv git gettext

echo "================="
echo "Installing xschem"
echo "================="
# Xschem
# Setup
cd $RUN_DIR
git clone https://github.com/StefanSchippers/xschem
cd xschem
./configure --prefix=$TOOLS_DIR
make -j$(nproc)
make install

# ngspice integration
mkdir -p $HOME/icdesign/simulations/
echo ng_behavior=hsa >> $HOME/icdesign/simulations/.spiceinit
echo ng_nomodcheck >>$HOME/icdesign/simulations/.spiceinit

echo "==================="
echo "Installing xcircuit"
echo "==================="
# xcircuit
cd $RUN_DIR
git clone git://opencircuitdesign.com/xcircuit
cd xcircuit 
aclocal && automake --add-missing && autoconf
./configure --prefix=$TOOLS_DIR
make -j$(nproc)
make install


echo "=================="
echo "Installing ngspice"
echo "=================="
# ngspice
cd $RUN_DIR
git clone git://git.code.sf.net/p/ngspice/ngspice
cd ngspice
./autogen.sh
mkdir release
cd release
../configure --prefix=$TOOLS_DIR --with-x --enable-xspice --enable-cider --enable-predictor --enable-osdi --enable-pss --with-readline=yes --enable-openmp --disable-debug CFLAGS="-m64 -O2" LDFLAGS="-m64 -s"
make -j$(nproc)
make install

echo "================"
echo "Installing magic"
echo "================"
# magic
cd $RUN_DIR
git clone git://opencircuitdesign.com/magic
cd magic
./configure --prefix=$TOOLS_DIR
make -j$(nproc)
make install


# klayout
# TODO

echo "================="
echo "Installing netgen"
echo "=================="
#netgen
cd $RUN_DIR
git clone git://opencircuitdesign.com/netgen
cd netgen
./configure --prefix=$TOOLS_DIR
make -j$(nproc)
make install

echo "====================="
echo "Installing xschem-gaw"
echo "====================="
#xschem-gaw
cd $RUN_DIR
git clone https://github.com/StefanSchippers/xschem-gaw
cd xschem-gaw
# TODO: Automate this patch
sed -i "s/GETTEXT_MACRO_VERSION = 0.18/GETTEXT_MACRO_VERSION = 0.20/" po/Makefile.in.in
aclocal && automake --add-missing && autoconf
./configure --prefix=$TOOLS_DIR
make -j$(nproc)
make install

# Xyce
# TODO: Automate this

# Edit PATH variable:
echo export PATH="\$PATH:$TOOLS_DIR/bin" >> $HOME/.bashrc
export PATH="$PATH:$TOOLS_DIR/bin"


echo "====================================="
echo "Setting up Python Virtual Environment"
echo "====================================="
# Python Libraries
mkdir -p $TOOLS_DIR/python_venv
cd $TOOLS_DIR/python_venv
python -m venv .
source bin/activate
pip install numpy scipy matplotlib pandas sympy
pip install jupyterlab
pip install slycot
pip install control
pip install serdespy spyci
deactivate

echo "======================================"
echo "Installing xschem Skywater 130 symbols"
echo "======================================"
# Skywater 130 symbols
mkdir -p $LIB_DIR
cd $LIB_DIR
git clone https://github.com/StefanSchippers/xschem_sky130

echo "==========================="
echo "Installing Skywater 130 PDK"
echo "==========================="
# Skywater PDK
cd $RUN_DIR
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
./configure --prefix=$PDK_DIR --enable-sky130-pdk --enable-sram-sky130 --enable-osu-t12-sky130 --enable-osu-t15-sky130 --enable-osu-t18-sky130
make -j$(nproc)
make install

echo "==============="
echo "Setup Complete!"
echo "==============="


