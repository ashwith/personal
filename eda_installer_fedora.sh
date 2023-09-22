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
sudo dnf groupinstall -y "Development Tools" "Development Libraries"
sudo dnf install -y libXrender libXrender-devel libX11 libX11-devel libX11-xcb\
                    libxcb libxcb-devel cairo cairo-devel tcl tcl-devel tk\
                    tk-devel bison flex libXpm xterm tcl-tclreadline\
                    gtk3-devel automake libXt libXt-devel libtool libXaw\
                    libXaw-devel readline readline-devel fftw fftw-devel cmake\
                    octave octave-control octave-doc octave-general maxima\
                    maxima-gui mesa-libGLU-devel g++ gettext gettext-devel\
                    lapack lapack-devel blas blas64 blas-devel\
		    qt5-qtbase qt5-qtbase-devel qt5-qtmultimedia\
		    qt5-qtmultimedia-devel qt5-qtxmlpatterns\
		    qt5-qtxmlpatterns-devel qt5-qtsvg qt5-qtsvg-devel\
		    qt5-qttools qt5-qttools-devel zlib-devel ruby ruby-devel\
                    python3 python3-devel\

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
export RPM_ARCH=bla
export RPM_PACKAGE_RELEASE=bla
export RPM_PACKAGE_VERSION=bla
export RPM_PACKAGE_NAME=bla
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
cd $RUN_DIR
mkdir -p $TOOLS_DIR/klayout
git clone https://github.com/KLayout/klayout.git
cd klayout
./build.sh -bin $TOOLS_DIR/klayout -option -j$(nproc)

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
./configure --prefix=$PDK_DIR --enable-sky130-pdk --enable-sram-sky130
#./configure --prefix=$PDK_DIR --enable-sky130-pdk --enable-sram-sky130 --enable-osu-t12-sky130 --enable-osu-t15-sky130 --enable-osu-t18-sky130
make -j$(nproc)
make install

echo "==============="
echo "Setup Complete!"
echo "==============="
