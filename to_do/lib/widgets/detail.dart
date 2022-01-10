import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {

  // 1) Creating a variable to store the data for this page
  final todoItem;
  // 2) Create constructor so data can be passed later!
  DetailPage({this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page"),),
      body:Center(
        child: Column(
          children: [
            Text(todoItem["name"]!),
            Text(todoItem["place"]!),
            Text(todoItem["description"]!),
          ],
        ),
      )
    );
  }
}
