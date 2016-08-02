
if [ "$PSLSEDIR" == "" ]
then
  echo "Set PSLSEDIR environment variable to pslse root directory"
  exit 1
fi

rm -r xelab.* xsc.* xsim.dir/ xvlog.*
xsc $PSLDIR/afu_driver/src/afu_driver.c
xvlog --sv *.sv
xelab -timescale 1ns/1ps -svlog *.sv *.v -sv_root . -sv_lib libdpi -debug all
