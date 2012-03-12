#!/bin/bash
#
#  Run with 1, 2, 4 and 8 threads.
#
delta_x=3
delta_t=0.001
num_steps=30000
TOL=0.001
KD=10
p=2
E=9e9
s_critical=0.15
write_delta=5

rm *.vtp *.geo
echo "Run with 2 threads."
export OMP_NUM_THREADS=2
start_time=$(date +%s)
peri_mp $delta_x $delta_t $num_steps $TOL $KD $p $E $s_critical $write_delta
finish_time=$(date +%s)
echo "Time duration: $((finish_time - start_time)) secs."

