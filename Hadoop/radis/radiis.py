import redis
import json

# Se connecter à Redis
r = redis.Redis(host='localhost', port=6379, db=0)  # Assurez-vous d'ajuster l'hôte et le port si nécessaire

# Document JSON donné
data = {
    "id": 1,
    "nom": {
        "prénom": "Philippe",
        "famille": "Rigaux"
    },
    "tél": 2157786,
    "email": "philippe@cnam.fr"
}

# Convertir le dictionnaire JSON en une chaîne JSON
json_data = json.dumps(data)

# Utiliser HSET pour stocker les valeurs dans Redis
# Ici, nous utilisons "id" comme nom de la clé dans Redis
# et stockons la chaîne JSON sous cette clé
r.hset("personne:1", "info", json_data)

# Vous pouvez également accéder aux valeurs individuelles du hash
# Par exemple, pour accéder au prénom, vous pouvez utiliser HGET
prenom = r.hget("personne:1", "info")
prenom_data = json.loads(prenom)
print("Prénom:", prenom_data["nom"]["prénom"])
