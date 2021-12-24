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
				exec 1>$x$y$z.txt
				echo $x$i$z
			done
			cd ..
		done
		cd ..

	done
	exec 1>&5
}

files_exist(){
	exist=false
	for ((i=0; i<=9; i++))
	do
		if [ -d $i ] 
		then
			exist=true 
		fi
	done
	echo $exist
}

if [ $# -eq 2 ]
then
	if [ $m -ge 0 ] && [ $m -le 9 ] && [ $n -ge 0 ] && [ $n -le 9 ] && [ $m -le $n ]
	then
		echo "i will now create some files"
		exist=$(files_exist)
		echo "exist = $exist"
		if [ $exist == "false" ]
		then
			create_file $m $n
		else
			echo "filese already exist"
		fi
	else
		echo "numbers are not correct"
	fi
elif [ $# -le 2 ]
then
	echo "not enough paramaters given"
else
	echo "too many paramaters given"
fi

