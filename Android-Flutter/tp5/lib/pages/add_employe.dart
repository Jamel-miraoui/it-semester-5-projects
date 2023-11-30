import 'package:flutter/material.dart';
import 'package:tp5/db/database.dart';
import 'package:tp5/model/employe.dart';
import 'package:tp5/widgets/custom_button.dart';
import 'package:tp5/widgets/custom_text.dart';


class AddEmploye extends StatefulWidget {
  const AddEmploye({super.key});

  @override
  State<AddEmploye> createState() => _AddEmployeState();
}

/*
  Matriucle: int 6, nom ,prenom, genre: M/F , Permis: A,b 
*/
class _AddEmployeState extends State<AddEmploye> {
  final formkey = GlobalKey<FormState>();

  var employe = ModelEmploye();
  DataBaseHelper database = DataBaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un nouveau Employé"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                CustomTextForm(
                  label: "Matriucle",
                  hint: "Donner matricule employé",
                  uneIcone: Icons.numbers,
                  typeClavier: TextInputType.number,
                  valider: (value) {
                    if (value == null || value.length == 0)
                      return "matricule obligatoire";
                    if (value.length != 6)
                      return "format matricule incorect 6 chiffres";
                    return null;
                  },
                  saved: (String? value) {
                    employe.setMatricule = int.parse(value!);
                  },
                ),
                CustomTextForm(
                  label: "Nom",
                  hint: "Donner nom  employé",
                  uneIcone: Icons.person_2,
                  typeClavier: TextInputType.name,
                  valider: (value) {
                    if (value == null || value.length == 0)
                      return "NOM obligatoire";
                    if (value.length < 2) return "nom  incorect 2car";
                    return null;
                  },
                ),
                CustomTextForm(
                  label: "Prénom",
                  hint: "Donner le prénom  employé",
                  uneIcone: Icons.person,
                  typeClavier: TextInputType.name,
                  valider: (value) {
                    if (value == null || value.length == 0)
                      return "prenom obligatoire";
                    if (value.length < 2) return "format prenom  incorect 2car";
                    return null;
                  },
                ),
                Padding(padding: EdgeInsets.only(top: 14)),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomBouton(
                          text: "Enregister",
                          onpressed: () {
                            if (formkey.currentState!.validate()) {
                              print("Form ok");
                              formkey.currentState!.save();
                              print(employe);
                              database.add(employe);
                            } else
                              print("Form NOT ok");
                          },
                          couleur: Colors.green),
                      CustomBouton(
                          text: "Annuler",
                          onpressed: () {},
                          couleur: Colors.red),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
