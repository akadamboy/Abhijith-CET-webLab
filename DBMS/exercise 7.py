import pymongo
url="mongodb://localhost:27017"
c = pymongo.MongoClient(url)
db = c["College"]
coll = db["Stud_list"]

print("\n\nQ1:\n")
for x in coll.find({"gender":"female","course":"MCA"}):
	print(x["name"]["fname"]+" "+x["name"]["lname"]+" "+x["course"]+" "+x["gender"])

print("\n\nQ2:\n")
for m in coll.find({"course":"MCA"}).sort("mark",-1).limit(1):
	print(m["name"]["fname"]+" "+m["name"]["lname"]+" "+str(m["mark"]))

print("\n\nQ3:\n")
for x in coll.find({"gender":"male","grade":"A+"},{"_id":0,"name.fname":1,"name.lname":1,"grade":1,"gender":1}):
	print(x["name"]["fname"]+" "+x["name"]["lname"]+" "+x["grade"]+" "+x["gender"])

print("\n\nQ4:\n")
for s in coll.find().sort("course","Mechanical").sort("mark",-1).limit(3):
	print(s["name"]["fname"]+" "+s["name"]["lname"]+" "+str(s["mark"]))

print("\n\nQ5:\n")
for i in coll.find({"gender":"female"}):
	print(i["name"]["fname"]+" "+i["name"]["lname"]+" "+str(i["mark"]))

print("\n\nQ6:\n")
for i in coll.find({"mark":{'$gt':80,'$lt':90}}):
	print(i["name"]["fname"]+" "+i["name"]["lname"]+" "+i["course"]+" "+str(i["mark"]))

print("\n\nQ7:\n")
for i in coll.find({"name.fname":{'$regex': '^V'}}):
	print(i["name"]["fname"]+" "+i["name"]["lname"])

print("\n\nQ8:\n")
for x in coll.find({"address.city":"Kollam"}):
	print(x["name"]["fname"]+" "+x["name"]["lname"]+" "+x["address"]["city"])

print("\n\nQ9:\n")
for x in coll.find({'$nor':[{"address.city":{'$in': ['Kollam','Thiruvananthapuram']}}]}):
	print(x["name"]["fname"]+" "+x["name"]["lname"]+" "+x["address"]["city"])

print("\n\nQ10:\n")

for x in coll.find({"gender":"female",'$nor':[{"address.city":'Kollam'},{"address.city":'Thiruvananthapuram'}]}):
	print(x["name"]["fname"])

