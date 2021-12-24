#!/bin/bash




sumOfFiles(){
	m=$1
	n=$2
	cd CWFiles
	sum=0
	for(( x=$m; x<=$n; x++ ))
	do
		cd $x
		for (( y=$m; y<=$n; y++ ))
		do
			cd $y
			for (( z=$m; z<=$n; z++ ))
			do
				if [ -f $x$y$z.txt ]
				then	 
					exec 0<$x$y$z.txt
					read number
					sum=$(($sum + $number))
				fi
			done
			cd ..
		done
		cd ..
	done
	cd ..
	echo $sum

}


m=$1
n=$2

if [ -d CWFiles ]
then	
	cd CWFiles
	for ((i=0; i<=9; i++))
	do 
		if [ -d $i ]
		then
			if  [ -z $low ]
			then 
				low=$i
			fi
			high=$i
		fi
	done
	cd ..
fi

echo "low: $low"
echo "high: $high"





echo $(sumOfFiles $m $n)



