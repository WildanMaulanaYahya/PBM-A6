// ignore_for_file: camel_case_types, use_key_in_widget_constructors, file_names, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

void main() {
  runApp(logout());
}

class logout extends StatelessWidget {
  get children => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF3A8C6E),
        body: Center(
            child: Container(
                width: 350,
                height: 160,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 255, 255, 255)),
                
                child: Column(children: [Text(
                  "Apakah Anda Yakin Ingin Log out",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontFamily: "poppins"))
                  
                  ,ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9CD94E)
                  ),
                  
                  
                   child: const Text("Iya",
                   style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,)))],)
                
                  ,
                ))),
      
    );
  }
}
