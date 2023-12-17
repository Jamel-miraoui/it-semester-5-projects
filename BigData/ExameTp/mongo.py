from pymongo import MongoClient

client = MongoClient("localhost", 27017)
db = client.miraoui 
collection_sms = db.SMS
collection_abonne = db.abonne

pipeline = [
    {"$group": {"_id": "$Source", "count": {"$sum": 1}}}
]
result_9 = list(collection_sms.aggregate(pipeline))
for item in result_9:
    sourceN = item['_id']
    msgc = item['count']
    print(f"Source Number {sourceN}: {msgc} messages")

abonneN = "NuméroAbonne"  # Replace with the actual abonne number
abonne = collection_abonne.find_one({"_id": abonneN})
if abonne:
    nom = abonne.get("Name", "Unknown")
    print(f"Nom de la personne abonnée avec le num :{abonneN}: {nom}")
else:
    print(f"Num abonne: {abonneN}")
