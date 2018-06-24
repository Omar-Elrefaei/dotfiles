BEGIN{

	noOfRows = 5
	noOfColumns = 6

	noOfCells = noOfColumns*noOfRows
	cellsPrinted = 1

	initHor = 79
	initVer = 27

	transHor = 19.4
	transVer = 12

	hor = 0
	ver = 0
	
	for (i=0; i < noOfRows; i++){
		for (j=0; j < noOfColumns; j++){

			hor = initHor - (transHor * j)
			ver = initVer + (transVer * i)
			
			print "<Button"> "awk_out"
			print "android:id=\"@+id/button" j "." i "." cellsPrinted "\"\n"> "awk_out"
			
			print "app:layout_marginLeftPercent=\"" hor "%\"" > "awk_out"
			print "app:layout_marginTopPercent=\"" ver "%\"\n" > "awk_out"


			print "android:background=\"@android:color/transparent\"" > "awk_out"
			print "app:layout_heightPercent=\"11%\"" > "awk_out"
			print "app:layout_widthPercent=\"19.1%\"" > "awk_out"
			print "android:onClick=\"sound\"/>\n\n\n" > "awk_out"
            
			
			
			cellsPrinted++

		}

	}
}


