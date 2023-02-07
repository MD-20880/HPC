#!/bin/bash

set -e # exit on error


FILEPATH=`pwd` 

echo "Compiling the code"
make # compile the code

#Collect Environment Variables



echo "Running"
# sbatch -W job_submit_d2q9-bgk #Submit the Job
echo "Job complete"


echo "Checking"
make check #Check the Result
echo "Check complete"

#Archive the results
echo "Archiving"
ls | wc -l | awk '{printf( "%05d\n" , $1)}' | FILENAME=
mkdir -p $FILEPATH/Archive/$FILENAME
for i in av_vels.dat final_state.dat d2q9-bgk.out d2q9-bgk; do
    mv $i $FILEPATH/Archive/$FILENAME
done
for i in d2q9-bgk.c Makefile; do
    cp $i $FILEPATH/Archive/$FILENAME
done







