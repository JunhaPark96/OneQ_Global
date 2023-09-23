from bs4 import BeautifulSoup
import json
import requests
html = 'https://www2.my.commbank.com.au/netbank/EO.Apply.MigrantCustomers/Application.aspx?dl=DCSQPJEP4L'

soup = BeautifulSoup(html, 'html.parser')
countries = []

for option in soup.select('select[name="country"] option'):
    value = option['value']
    if value.isnumeric():  # 숫자 값만 처리합니다.
        description = option.text
        disabled = option.has_attr('disabled')
        countries.append({
            "Description": description,
            "Value": int(value),
            "Disabled": disabled
        })

json_object = {"Countries": countries}

with open('countries.json', 'w', encoding='utf-8') as json_file:
    json.dump(json_object, json_file, ensure_ascii=False, indent=4)

print('JSON file has been created.')