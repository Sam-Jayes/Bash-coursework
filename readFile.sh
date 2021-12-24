#!/bin/bash









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

if [ -z $low ] || [ -z $high ] || [-d CWFiles ]
then
	echo "no files exist"
fi

echo "low: $low"
echo "high: $high"
