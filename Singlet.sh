echo "Welcome Flip Coin Simulation"

read -p "Enter the number to flip the coin: " no

declare -A Dictionary

for (( i=0; i<no; i++ ))
do
	coin=$(( RANDOM%2 ))

	if [ $coin -eq 0 ]
	then
		if [ ${Dictionary['H']} ]
		then 
			count=${Dictionary['H']}
			Dictionary['H']=$(( ++count ))
		else
			Dictionary['H']=1
		fi
	elif [ $coin -eq 1 ]
	then
		if [ ${Dictionary['T']} ]
                then
                        count=${Dictionary['T']}
                        Dictionary['T']=$(( ++count ))
                else
                        Dictionary['T']=1
		fi
	fi

done

echo ${!Dictionary[@]}
echo ${Dictionary[@]}

if [ ${Dictionary['H']} -gt ${Dictionary['T']} ]
then
	percentage=`echo ${Dictionary['H']} $num | awk '{print ($1/$2)*100}'`
	echo "H:"$percentage"%"
elif [ ${Dictionary['T']} -gt ${Dictionary['H']} ]
then
        percentage=`echo ${Dictionary['T']} $num | awk '{print ($1/$2)*100}'`
        echo "T:"$percentage"%"
else
	percentage=`echo ${Dictionary['H']} $num | awk '{print ($1/$2)*100}'`
        echo "T:"$percentage"%"
fi
