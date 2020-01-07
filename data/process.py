import requests
from bs4 import BeautifulSoup
import csv

#####################################################################################################

#Source1 - Oilconsumption worldwide per year
result1 = requests.get('https://www.indexmundi.com/energy/')

#Source2 - Oil production per country
result2 = requests.get('https://en.wikipedia.org/wiki/List_of_countries_by_oil_production')

#Source3 - Oil consumption per country per day
result3 = requests.get('https://en.wikipedia.org/wiki/List_of_countries_by_oil_consumption')

####################################################################################################

#Save source1 in variable
src1 = result1.content

#Save source2 in variable
src2 = result2.content

#Save source3 in variable
src3 = result3.content

####################################################################################################

#Activate soup
soup1 = BeautifulSoup(src1,'lxml')
soup2 = BeautifulSoup(src2,'lxml')
soup3 = BeautifulSoup(src3,'lxml')

######################################################################################################

#SOURCE 1 - Look for table and save in CSV 
tbl = soup1.findAll('table')
tbl2 = tbl[5]
with open ('worldwide.csv','w',newline='') as f:
    writer = csv.writer(f)
    for tr in tbl2('tr'):
        row = [t.get_text(strip=True)for t in tr(['td','th'])]
        cell1 = row[0]
        cell2 = row[1].replace(",",'')
        row = [cell1,cell2]
        writer.writerow(row)

######################################################################################################

#SOURCE 2 - Look for table and save in CSV
table = soup2.find('table')
with open ('oilproduction.csv','w',newline='') as f:
    writer = csv.writer(f)
    writer.writerow(('Country','Oil Production(bbl/day)'))
    for tr in table('tr')[2:]:
        row = [t.get_text(strip=True) for t in tr(['td','th'])]
        cell2 = row[1].replace("(OPEC)","").replace("[6]",'').replace(",","")
        cell3 = row[2].replace(",",'')
        row = [cell2,cell3]
        writer.writerow(row)

#####################################################################################################

#SOURCE 3 - Look for table and save in CSV
tablee = soup3.find('table')
with open ('oilconsumption.csv','w',newline='') as f:
    writer = csv.writer (f)
    for tr in tablee('tr'):
        row = [t.get_text(strip=True) for t in tr(['td','th'])]
        cell2 = row[1]
        cell3 = row[2].replace(',','').replace('[4]','')
        row = [cell2,cell3]
        writer.writerow(row)

#####################################################################################################





