#!/bin/bash
# create an out with numbers 0-9


exec 5>&1

m=$1
n=$2

for ((x=$m; x<=$n; x++))
do
	mkdir $x
	cd $x
	for ((y=$m; y<=$n; y++))
	do
		mkdir $y
		cd $y	
		for ((z=$m; z<=$n; z++))
		do
			exec 1> $x$y$z.txt
			echo $x$i$z
		done
		cd ..
	done
	cd ..

done
exec 1>&5
