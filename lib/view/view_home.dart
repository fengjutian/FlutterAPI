import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            child: Column (
              children: [
                Text("Hello1"),
                Text("Hello2")
              ],
            )
        )
    );
  }
}