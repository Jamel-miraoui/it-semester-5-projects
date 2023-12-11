import 'package:examentp/DataBase/databaseManager.dart';
import 'package:examentp/Entity/Voyage.dart';
import 'package:examentp/Widget/CustomButton.dart';
import 'package:examentp/Widget/CustomTextForm.dart';
import 'package:flutter/material.dart';

class AjouterVoyage extends StatefulWidget {
  const AjouterVoyage({Key? key}) : super(key: key);

  @override
  State<AjouterVoyage> createState() => _AjouterVoyageState();
}

class _AjouterVoyageState extends State<AjouterVoyage> {
  databaseManager db = databaseManager.instance;
  final Formkey = GlobalKey<FormState>();
  Voyage voyage = Voyage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Examen Tp : Jamel Miraoui"),
        ),
        body: Center(
          child: Column(
            children: [
              Form(
                key: Formkey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       CustomTextForm(
                        label: "depart",
                        hint: "Entre le Nom de Station",
                        uneIcone: Icons.add_location_alt,
                        valider: (value) {
                          if (value!.length > 10 || value.length < 5) {
                            return "Station dedepart";
                          } else {
                            return null;
                          }
                        },
                        saved: (value) {
                          voyage.depart = value!;
                        },
                      ),CustomTextForm(
                        label: "arrive",
                        hint: "station d'arrive",
                        uneIcone: Icons.add_location_alt,
                        saved: (value) {
                          voyage.arrive = value!;
                        },
                      ),
                      CustomTextForm(
                        label: "duree",
                        typeClavier: TextInputType.number,
                        hint: "duree de voyage",
                        uneIcone: Icons.add_location_alt,
                        saved: (value) {
                          voyage.duree = value! as int;
                        },
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBouton(
                              onpressed: () {
                                if (Formkey.currentState?.validate() ?? false) {
                                Formkey.currentState!.save();
                                db.addVoyage(voyage);
                              }
                              },
                              text: "Reset",
                              couleur: Colors.green,
                            ),
                            Padding(padding: EdgeInsets.all(8),),
                            CustomBouton(
                              onpressed: () {
                                Formkey.currentState?..reset();
                              },
                              text: "Reset",
                              couleur: Colors.red,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
