#!/bin/bash


echo ""
echo "C with asm"
time for i in `seq 100`; do cat list_milosny.txt | bin/gaderyfilter >/dev/null; done


echo ""
echo "Python interpreter"
time for i in `seq 100`; do cat list_milosny.txt | python -O gaderypoluki.py >/dev/null; done
