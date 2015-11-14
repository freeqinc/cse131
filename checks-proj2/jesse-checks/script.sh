#!/bin/bash

# recompile
make -C ../../. new
file=$1
outputdir="results"

# run locally
java -cp ./../../lib/java-cup-v11a.jar:./../../bin RC -debug $file > $outputdir/$file.out

# copy file to server and run RC remotely, grab rc.s file
scp $1 jeqin@ieng9.ucsd.edu:cse131-proj1-jeqin/.
ssh jeqin@ieng9.ucsd.edu "cd ~/cse131-proj1-jeqin && /home/solaris/ieng9/cs131f/public/bin/testrunner_client -debug $file" > $outputdir/$file.remote.out
scp jeqin@ieng9.ucsd.edu:cse131-proj1-jeqin/rc.s $outputdir/.
ssh jeqin@ieng9.ucsd.edu "cd ~/cse131-proj1-jeqin && /software/common/solstudio12/bin/cc rc.s ./input.c ./output.s && ./a.out" > $outputdir/rc.s.output



# run RC locally
# java -cp ./../../lib/java-cup-v11a.jar:./../../bin RC -debug $file > $outputdir$file.out

# sync filename outputs and remove extras
#sed -i -e 's/".*"/"output.rc"/g' $outputdir$file.remote.out
# sed -i -e 's/".*"/"output.rc"/g' $outputdir$file.out
# rm $outputdir$file.remote.out-e
# rm $outputdir$file.out-e

# check diffs and output
# echo ""
# echo "Done running on reference and local... comparing output"
# echo ""
# echo "----------------------------------"
# echo "Differences (expected vs. actual):"
# echo "----------------------------------"
# diff $outputdir$file.out $outputdir$file.remote.out
#
# echo ""
# echo "Opening in opendiff"
opendiff rc.s $outputdir/rc.s
