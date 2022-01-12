import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailPage extends StatelessWidget {

  // 1) Creating a variable to store the data for this page
  final todoItem;
  // 2) Create constructor so data can be passed later! [read the book chapter 3 on OOP)
  DetailPage({this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail page"),),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(todoItem["name"]!, style: GoogleFonts.lato(
            textStyle: TextStyle(color: Colors.red, fontSize: 32),)
          )
              ,
              SizedBox(height:8),
              Text(todoItem["place"]!,
                  style: GoogleFonts.notoSans(
                    textStyle:  TextStyle(color: Colors.blue, fontSize: 20))
              ),
              SizedBox(height: 8,),
              Text(todoItem["description"]!),
            ],
          ),
        ),
      )
    );
  }
}
