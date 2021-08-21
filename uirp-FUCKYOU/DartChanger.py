import sys
import yaml
import json
from subprocess import call
import ruamel.yaml
from ruamel.yaml import YAML
from collections import OrderedDict
# Handling address json and abi
f = open('../truffleSide/build/contracts/Everything.json')
data = json.load(f)
contract_address = data['networks']['3']['address']
abi = data['abi']
print(data)
#Empty the file
files_tochange = ["./lib/Everything.json", "./assets/Everything.json"]

for x in files_tochange:
    jsonFile = open(x, "w")
    jsonFile.write("")
    jsonFile.close()

    with open(x, 'a') as jsonFile:
        jsonFile.write("[\n")
        for line in abi:
            json.dump(line, jsonFile, indent=4, sort_keys = True)
            if line != abi[-1]:
                jsonFile.write(',')
        jsonFile.write("\n]")
        jsonFile.close()

jsonFile = open("./assets/Everything.json", "w")
jsonFile.write("")
jsonFile.close()
with open("./assets/Everything.json", 'w') as jsonFile:
    json.dump(data, jsonFile, indent = 2)