import 'dart:convert';

import 'package:flutter/material.dart';
import './detail.dart';
import './add.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // In Flutter this is called list, instead of array
  var todos = [
  ];

  @override
  void initState() {
    loadData();
    super.initState();
  }
// part where we load the data
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('todos') != null){
      String data  = prefs.getString('todos')!;
          setState(() {
            todos = jsonDecode(data);
          });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("Home"),
          actions:[
            IconButton(onPressed: () async {
              final data = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AddPage())
              );
              todos.add(data["newItem"]!);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString("todos", jsonEncode(todos));
              print(todos);
              setState(() {
                // In flutter we use add instead of a push
                todos;

              });

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
