import 'package:examentp/DataBase/databaseManager.dart';
import 'package:examentp/Entity/Station.dart';
import 'package:examentp/Widget/CustomButton.dart';
import 'package:examentp/Widget/CustomTextForm.dart';
import 'package:flutter/material.dart';

class AjouterStation extends StatefulWidget {
  const AjouterStation({super.key});

  @override
  State<AjouterStation> createState() => _AjouterStationState();
}

class _AjouterStationState extends State<AjouterStation> {
  databaseManager db = databaseManager.instance;
  final Formkey = GlobalKey<FormState>();
  Station station = Station();
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
                      CustomTextForm(
                        label: "Nom Station",
                        hint: "Entre le Nom de Station",
                        uneIcone: Icons.add_location_alt,
                        valider: (value) {
                          if(value!.length > 10 || value.length < 5 ){return "comprise entre 5 e 10 caractéres" ; } else {return null ;}
                        },
                        saved: (value) {
                          station.nomstation = value!;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBouton(
                            onpressed: () {
                              if (Formkey.currentState?.validate() ?? false) {
                                Formkey.currentState!.save();
                                db.addStation(station);
                              }
                            },
                            text: "Save",
                            couleur: Colors.green,
                          ),
                          Padding(padding: EdgeInsets.all(8)) ,
                          CustomBouton(
                            onpressed: () {
                              Formkey.currentState?..reset();
                            },
                            text: "Reset",
                            couleur: Colors.red,
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
