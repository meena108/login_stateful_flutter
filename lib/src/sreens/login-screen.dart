import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container (
        height: 200,
        width: 200,
        color: Colors.red,
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.all(25),
        child: Form (
          child: Column (
            children: [
              buildEmailField(),
            ]

          ),

        ),
      ),

    );

     }
  Widget buildEmailField () {
     return TextFormField(
       decoration: InputDecoration (
         labelText: " Your email",
         hintText: "email@gmail.com",
           border: OutlineInputBorder (

       )
       ),
     );
  }
}
