import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String email;
  SecondScreen({required this.email})
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Second screen"),
      ),
      body: Center (
        child: ElevatedButton (
          onPressed: () {
          //  back jana lagi with pop
            Navigator.of(context).pop(["success", "fail"]);
          },
          child: Text("Go back $email"),
        ),
      ),
    );
  }
}
