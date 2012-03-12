#!/bin/bash
for i in $( ls -d */ ); do
  cd $i
  ./run.sh
  cd ..
done
