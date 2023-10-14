class compte {
  String nom_client = "";
  String prenom_client = "";
  double solde_final = 0;

  compte(this.nom_client, this.prenom_client, this.solde_final);

  String get nom => this.nom_client;
  String get prenom => this.prenom_client;
  double get solde => this.solde_final;

  set nom(String nom_client) => this.nom_client = nom_client;
  set prenom(String prenom_client) => this.prenom_client = prenom_client;
  set solde(double solde_final) => this.solde_final = solde_final;

  void deposer(double montant) {
    solde_final = solde_final + montant;
  }

  void retirer(double montant) {
    solde_final = solde_final - montant;
  }

  void afficherSolde() {
    print(solde_final);
  }

  void debiter(compte c1, compte c2, double montant) {
    c1.retirer(montant);
    c2.deposer(montant);
  }
}

void main() {
  var c1 = compte("aa", "aaa", 0);
  var c2 = compte("bb", "bbb", 0);
  c1.deposer(200);
  c2.deposer(1000);
  c2.retirer(30);
  c1.retirer(75);
  c2.deposer(75);
  c1.afficherSolde();
  c2.afficherSolde();
}
