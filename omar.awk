{
        n=0
	

        	if ($0 ~ /app:layout_marginLeftPercent="[0-9]\.*[0-9]*%"/) {


                	n = split($0, part, /"/)
                	if (n == 3) print part[1] "\"" part[2]+1 "%\"" part[3] > "awk_out"

        	}
        	if (n != 3) print > "awk_out"

	
}
