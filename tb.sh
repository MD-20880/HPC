#!/bin/bash

set -e # exit on error


FILEPATH=`pwd` 

echo "Compiling the code"
make # compile the code

#Collect Environment Variables





echo "Running"
if [ $(OSTYPE) == darwin22.0]; then
    echo "Running on Mac"
    ./d2q9-bgk input_128x128.params obstacles_128x128.dat
else
    echo "Running on BC4"
    sbatch -W job_submit_d2q9-bgk #Submit the Job


fi
# sbatch -W job_submit_d2q9-bgk #Submit the Job
echo "Job complete"


echo "Checking"
make check #Check the Result
echo "Check complete"

#Archive the results
echo "Archiving"
FILENAME=$(ls ./Archive | wc -l | awk '{printf( "%05d\n" , $1)}')
echo $FILENAME

if [FILENAME == ""]; then
    echo "Generate Filename Failed"
    exit 1
fi 

mkdir -p $FILEPATH/Archive/$FILENAME
for i in av_vels.dat final_state.dat d2q9-bgk.out d2q9-bgk; do
    mv $i $FILEPATH/Archive/$FILENAME
done

for i in d2q9-bgk.c Makefile; do
    cp $i $FILEPATH/Archive/$FILENAME
done







