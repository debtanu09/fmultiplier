#!/bin/bash

iverilog fmultiplier.v
iverilog fmultiplier_tb.v
vvp a.out
gtkwave wave.vcd
