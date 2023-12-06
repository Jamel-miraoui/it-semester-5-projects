// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelEmployee {
  int matricule = 0;
  String nom = "";
  String prenom = "";

  ModelEmployee({
    int? matricule,
    String? nom,
    String? prenom,
  })  : matricule = matricule ?? 0,
        nom = nom ?? "",
        prenom = prenom ?? "";

  int get getMatricule => matricule;

  set setMatricule(int matricule) => this.matricule = matricule;

  String get getNom => nom;

  set setNom(String nom) => this.nom = nom;

  String get getPrenom => prenom;

  set setPrenom(String prenom) => this.prenom = prenom;

  ModelEmployee copyWith({
    int? matricule,
    String? nom,
    String? prenom,
  }) {
    return ModelEmployee(
      matricule: matricule ?? this.matricule,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'matricule': matricule,
      'nom': nom,
      'prenom': prenom,
    };
  }

  factory ModelEmployee.fromMap(Map<String, dynamic> map) {
    return ModelEmployee(
      matricule: map['matricule'] as int,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelEmployee.fromJson(String source) =>
      ModelEmployee.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ModelEmployee(matricule: $matricule, nom: $nom, prenom: $prenom)';

  @override
  bool operator ==(covariant ModelEmployee other) {
    if (identical(this, other)) return true;

    return other.matricule == matricule &&
        other.nom == nom &&
        other.prenom == prenom;
  }

  @override
  int get hashCode => matricule.hashCode ^ nom.hashCode ^ prenom.hashCode;
}
