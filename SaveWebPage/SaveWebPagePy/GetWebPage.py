import requests
from bs4 import BeautifulSoup
StartNumber=26000
urlstring="http://sine.ni.com/nips/cds/view/modelpopup/p/pcat/"
i=0
while(i<100000):
    i=i+1
    urlnumber=StartNumber+i
    fullurl=urlstring+str(urlnumber)
    res = requests.get(fullurl)
    res.encoding = 'utf-8'  #
    soup = BeautifulSoup(res.text, 'lxml')
    if soup.title.text.find("Not Found") == -1 :
        print(fullurl, soup.title.text)
        f = open('url.txt', 'a')
        f.write(fullurl + '\n')
        f.close()
    else:
        print(urlnumber,"\t", soup.title.text)


