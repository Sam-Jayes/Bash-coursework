#!/bin/bash
# create an out with numbers 0-9


exec 5>&1
#exec 1>out.dat # sets the output file discriptor (1) and directs output to file

for ((x=0; x<=9; x++))
do
	mkdir $x
	cd $x
	for ((y=0; y<=9; y++))
	do
		mkdir $y
		cd $y	
		for ((z=0; z<=9; z++))
		do
			exec 1> $x$y$z.txt
			echo $x$i$z
		done
		cd ..
	done
	cd ..

done
exec 1>&5
