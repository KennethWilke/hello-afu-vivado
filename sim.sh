rm -r xelab.* xsc.* xsim.dir/ xvlog.*
xsc ~/workprojects/pslse/afu_driver/src/afu_driver.c
xvlog --sv *.sv
xelab -timescale 1ns/1ps -svlog *.sv *.v -sv_root . -sv_lib libdpi -debug all
