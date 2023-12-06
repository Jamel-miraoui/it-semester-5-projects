import 'package:flutter/material.dart';
import 'package:tp6/Models/Employee.dart';
import 'package:tp6/Widget/DB/DataBase.dart';


class List_employe extends StatefulWidget {
  const List_employe({super.key});

  @override
  State<List_employe> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<List_employe> {
  @override
  var employe=ModelEmployee();
  DataBaseHelper database=DataBaseHelper.instance;
  List allEmp=[];

Future readData() async{
  List response = await database.getEmploye();
  setState(() {
    allEmp.addAll(response);
  });
}

@override
  void initState()
{
  readData();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(),
    body: ListView.builder(scrollDirection: Axis.vertical,itemCount: 10,itemBuilder:(context,index)
    {
      return Card(
        child: ListTile(
          title: Text(allEmp[index]['nom']),
          subtitle: Text(allEmp[index]['prenom']),
        ),
      );
    }
    ),
    );
  }
}