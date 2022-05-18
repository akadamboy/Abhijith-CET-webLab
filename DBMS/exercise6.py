import pymongo
url="mongodb://localhost:27017"
c=pymongo.MongoClient(url)
db=c["exam"]

coll=db["student"]

print("\n\nQ1-2:\n\n")

#coll.insert_one({'id':1,'Name':'Anjali','Place':'Kollam','Phone':'8582639562', 'Vaccination_status':'Both vaccinated',
#'RTPCR':'negative','Lab_mark':{'Internal':30,'External':45},'Department':'MC'})


#coll.insert_many([{'id':2,'Name':'Anuradha','Place':'Varkala','Phone':'9992639562','RTPCR':'negative',
#'Lab_mark':{'Internal':40,'External':48},'Department':'Civil'},

#{'id':3,'Name':'Bismiya','Place':'Kollam','Phone':'9446639562','Vaccination_status':'not vaccinated',
#'RTPCR':'positive','Lab_mark':{'Internal':50,'External':39},'Department':'MCA'},

#{'id':4,'Name':'Vimal','Place':'Ernakulam','Phone':'8582639568','Vaccination_status':'First dose only',
#'RTPCR':'positive','Lab_mark':{'Internal':40,'External':42},'Department':'Civil'},

#{'id':5,'Name':'Vivek','Place':'Kollam','Phone':'8582639777','Vaccination_status':'Both vaccinated',
#'RTPCR':'negative','Lab_mark':{'Internal':50,'External':58},'Department':'MCA'}
#])

for x in coll.find():
	print(x["Name"]+" "+str(x["Lab_mark"]["Internal"]))


print("\n\nQ3:\n")

for x in coll.find({'Vaccination_status':'Both vaccinated'}):
	print(x["Name"]+" "+str(x["Phone"]))

print("\n\nQ4:\n")

for x in coll.find().sort('Lab_mark.External',-1).limit(2):
	print(x["Name"]+" "+str(x["Phone"]))

print("\n\nQ5:\n")

for x in coll.find({"Name":{'$regex': '^A'}}):
	print(str(x["id"])+" "+x["Name"]+" "+x["Department"])

print("\n\nQ6:\n")

#myquery = { "id": 4 }
#newvalues = { "$set": { "Vaccination_status": "Both vaccinated" } }

#coll.update_many(myquery, newvalues)


for x in coll.find({"id":4}):
	print(str(x["id"])+" "+x["Name"]+" "+x["Vaccination_status"])

print("\n\nQ7:\n")

for x in coll.find().sort('Lab_mark.External',-1):
	print(x["Name"])





