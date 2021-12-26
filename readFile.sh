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


if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$2" =~ ^[0-9]+$ ]]
then
	m=$1
	n=$2
fi

echo "m: $m"
echo "n: $n"

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
if [ $# -eq 2 ]
then
	if [ -z "$low" ] && [ -z "$high" ]
	then	
		echo "No files have exist"
	elif [ -z "$m" ] && [ -z "$n" ]
	then
		echo "invalid inputs"
	else
		if [ $m -ge $low ] && [ $m -le $high ] && [ $n -ge $low ] && [ $n -le $high ] && [ $m -le $n ]
		then
			echo $(sumOfFiles $m $n)
		else
			echo "Invalid values input"
		fi
	fi
elif [ $# -lt 2 ]
then
	echo "Not Enough Paramaters Given"
else
	echo "Too Many Paramaters Given"
fi


