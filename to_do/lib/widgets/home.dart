import 'package:flutter/material.dart';
import 'package:to_do/widgets/detail.dart';
import './add.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var todos = [
    {
      "name":"Have Dinner",
      "place":"KFC",
      "description":"Bring housemates together"
    },
    {
      "name":"Update flutter notes",
      "place":"Home",
      "description":"Chapter API"
    },
    {
      "name":"Do Finance",
      "place":"Home",
      "description":"Pay bills and cc"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Home"),
          actions:[
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AddPage())
              );

            }, icon: Icon(Icons.add))
          ]),
      body:ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,position){
            return ListTile(
              title: Text(todos[position]["name"]!),
              subtitle:Text(todos[position]["place"]!),
              trailing: Icon(Icons.chevron_right),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DetailPage(todoItem: todos[position],))
                );
              }
            );
          })
    );
  }
}
