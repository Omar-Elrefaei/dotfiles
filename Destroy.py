from bs4 import BeautifulSoup
import urllib2
import re
 
def getLinks(url):
    html_page = urllib2.urlopen(url)
    soup = BeautifulSoup(html_page)
    links = []
 
    for link in soup.findAll('a', attrs={'href': re.compile("^http://")}):
        links.append(link.get('href'))
 
    return links

file = open("DesLinks", "w") 
file.write( getLinks("https://www.destroyallsoftware.com/screencasts/catalog") )
