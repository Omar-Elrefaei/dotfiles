import requests
from bs4 import BeautifulSoup

ph = requests.get('https://pornhub.com')
ph_html = BeautifulSoup(ph.text, 'html.parser')
lidev = ph_html.find("li","videoblock videoBox")
print(lidev)

