# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias wget='wget -c'
alias rm='rm -i'

EDITOR=`which vim`
export EDITOR

PATH=$PATH:/home/ashwith/bin/julia
export PATH
PATH=$PATH:/home/ashwith/bin/sagemath
export PATH
PATH=$PATH:/home/ashwith/bin/eagle-6.3.0/bin
export PATH
PATH=$PATH:/home/ashwith/bin/Xilinx
export PATH
PATH=$PATH:/home/ashwith/bin/scripts
export PATH
PATH=$PATH:/opt/smlnj/bin
export PATH
PATH=$PATH:/home/ashwith/bin/energia
export PATH
PATH=$PATH:/home/ashwith/bin/smlnj/bin
export PATH

alias modelsim='/home/ashwith/bin/altera/13.0/modelsim_ase/linuxaloem/vsim'
alias quartus='/home/ashwith/bin/altera/13.0/quartus/bin/quartus --64bit'

SMLROOT=$PATH:/opt/smlnj/bin
export SMLROOT

CLASSPATH=.:~/algs4/stdlib.jar:~/algs4/algs4.jar
export CLASSPATH

JAVAROOT=/home/ashwith/Development/java
export JAVAROOT
