import requests
import sys


#links = sys.argv[1]
links = 1

epi=["06","07","08","09","10","11","12","13","14","15","16","17","18"]

for x in range(12):
	y=epi[x]
	print(y)
#web = requests.get("https://thepiratebay.org/search/crazy%20girlfriend/0/99/0")
	url = "https://thepiratebay.org/search/Crazy%20Ex%20Girlfriend%20S01E" +(y)+ "/0/99/0"
	web = requests.get(url)


#html = BeautifulSoup(web.text, 'html.parser')
	html = web.text


	offset = 0

	for z in range(links):
		magnet = html.find('magnet:', offset)
		qoute =  html.find('"', magnet)
		string = html[magnet:qoute]
		offset = qoute

	#write str to file
		print(string)
		file = open('magnets', "a")
		file.write(string + '\n')
