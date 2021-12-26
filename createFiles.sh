#!/bin/bash
# create an out with numbers 0-9





create_file (){
	m=$1
	n=$2
	exec 5>&1
	cd CWFiles
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
				echo $x$y$z
			done
			cd ..
		done
		cd ..

	done
	cd ..
	exec 1>&5
}

files_exist(){
	exist=false
	if [ -d CWFiles ]
	then
		cd CWFiles
		for ((i=0; i<=9; i++))
		do
			if [ -d $i ] 
			then
				exist=true 
			fi
		done
		cd ..
	else
		mkdir CWFiles
	fi
	echo $exist
}

remove_files(){
	cd CWFiles
	rm -r [0-9]
	cd ..
}


if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$2" =~ ^[0-9]+$ ]]
then
	m=$1
	n=$2
fi

if [ $# -eq 2 ] && ! [ -z "$m" ] && ! [ -z "$n" ]
then
	if [ $m -ge 0 ] && [ $m -le 9 ] && [ $n -ge 0 ] && [ $n -le 9 ] && [ $m -le $n ]
	then
		#echo "$(files_exist)"
		exist=$(files_exist)
		if [ $exist == "false" ]
		then
			create_file $m $n
			echo "Files Created"
		else
			input=-1

			while [ $input != 1 ] &&  [ $input != 2 ]
			do
				echo "Filese already exist, please enter 1 to overwrite current files or 2 to cancel new file creation"
				read input
				if [ -z "$input" ] 
				then
					input=-1
				fi
			done
			if [ $input == 1 ]
			then 
				remove_files
				create_file $m $n
				echo "New Files Created"
			else
				echo "File Creation Cancelled"
			fi


		fi
	else
		echo "Numbers Input Are Not Valid"
	fi
elif [ $# -lt 2 ]
then
	echo "Not Enough Paramaters Given"
elif [ $# -gt 2 ] 
then
	echo "Too Many Paramaters Given"
else
	echo "Invalid input values given"
fi

