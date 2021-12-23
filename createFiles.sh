#!/bin/bash
# create an out with numbers 0-9


m=$1
n=$2


create_file (){
	m=$1
	n=$2
	exec 5>&1
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
}



if [ $m -ge 0 ] && [ $m -le 9 ] && [ $n -ge 0 ] && [ $n -le 9 ] && [ $m -le $n ]
then
	echo "i will now create some files"
else
	echo "numbers are not correct"
fi
#create_file $m $n
