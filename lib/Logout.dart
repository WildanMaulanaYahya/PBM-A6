// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(logout());
}

class logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3A8C6E),
        body: Center(
            child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                width: 350,
                height: 100,
                child: Text(
                  "Apakah Anda Yakin Ingin Log out",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontFamily: "poppins"),
                ))),
      ),
    );
  }
}
