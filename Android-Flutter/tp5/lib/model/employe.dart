// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelEmploye {
  int matricule;
  String nom;
  String prenom;

  ModelEmploye({
     this.matricule=0,
    this.nom="",
     this.prenom="",
  });

  
  int get getMatricule => this.matricule;
  set setMatricule( int matricule) => this.matricule = matricule;
 
 get getNom => this.nom;
 set setNom( nom) => this.nom = nom;

 get getPrenom => this.prenom;
 set setPrenom( prenom) => this.prenom = prenom;




  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
    };
  }

  factory ModelEmploye.fromMap(Map<String, dynamic> map) {
    return ModelEmploye(
      matricule: map['matricule'] as int,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelEmploye.fromJson(String source) => ModelEmploye.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ModelEmploye(matricule: $matricule, nom: $nom, prenom: $prenom)';

 

  
}
