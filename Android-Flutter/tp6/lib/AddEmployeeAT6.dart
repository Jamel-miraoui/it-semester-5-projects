import 'package:flutter/material.dart';
import 'package:tp6/Models/Employee.dart';
import 'package:tp6/Widget/CustomButton.dart';
import 'package:tp6/Widget/CustomTextForm.dart';
import 'package:tp6/Widget/DB/DataBase.dart';
class AddEmployeeAT6 extends StatefulWidget {
  const AddEmployeeAT6({super.key});

  @override
  State<AddEmployeeAT6> createState() => _AddEmployeeAT6State();
}

class _AddEmployeeAT6State extends State<AddEmployeeAT6> {
  @override
  var employee=ModelEmployee();
  final formkey=GlobalKey<FormState>();
   DataBaseHelper database =DataBaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(appBar: AppBar(title:const Text("formulaire"),),
        
       body: 
       
       SingleChildScrollView(scrollDirection: Axis.vertical,
         child: Form(key:formkey,child:Column(children: [
             Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextForm(typpe:TextInputType.text,label: "Matricule",hint: "donner votre matricule",uneIcon: Icons.numbers,valider:(value)
          {
            if(value!.isEmpty) {return "donner votre maticule"; return null;} 
            if(value.length<6) { return "donner votre maticule <6 caractere"; return null;}
            if(int.tryParse(value)==null) {return "donner une entier"; return null;}
            return null; 
          },saved:(String? value)
          {
            employee.matricule = int.parse(value!);
            return null;
          }

        
          ,),
          
             ),
             Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextForm(typpe: TextInputType.text,label: "Nom",hint: "donner votre Nom",uneIcon: Icons.home,valider:(value)
          {
            if(value!.isEmpty || value.length<3 ) {return "donner votre nom"; return null;}
            return null;
          }
          ,saved:(value)
          {
            employee.nom=value!;
            return null;
          },),
             ),
             
             Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextForm(typpe: TextInputType.text,label: "Prenom",hint: "donner votre Prenom",uneIcon: Icons.home,
          valider: (value)
          {
            if(value!.isEmpty) {return "donner votre prenom"; return null;}
            return null;
          },
          saved: (value)
          {
            employee.prenom=value!;
            return null;
          },),
             ),
             Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(text: "valider",onpressed:()  {
       { if(formkey.currentState!.validate())
           {formkey.currentState!.save();
           print(employee);
            database.add(employee);
         
      


           } 
       
       
          } },),
              
            ),CustomButton(text: "annuler",onpressed: (){
              formkey.currentState!.reset();
              formkey.currentState!.save();
            },),
          ],
             ),
             
          ])  ,),
       )
        ,
        ),
      ),
    );
    
    
  }


  Widget ButtonAnnuler()
  {
return ElevatedButton(onPressed: () {formkey.currentState!.reset(); formkey.currentState!.save(); }, child: const Text("annuler"));
  }

}
  
