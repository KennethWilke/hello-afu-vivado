
if [ "$PSLSEDIR" == "" ]
then
  echo "Set PSLSEDIR environment variable to pslse root directory"
  exit 1
fi

rm -r xelab.* xsc.* xsim.dir/ xvlog.*
xsc $PSLSEDIR/afu_driver/src/afu_driver.c
xvlog --sv *.sv *.v
xelab -timescale 1ns/1ps -svlog $PSLSEDIR/afu_driver/verilog/top.v -sv_root . -sv_lib libdpi -debug all
xsim -g work.top
