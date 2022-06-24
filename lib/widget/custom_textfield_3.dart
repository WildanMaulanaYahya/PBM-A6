import 'package:flutter/material.dart';

class CustomTextField3 extends StatelessWidget {
  final conn;
  const CustomTextField3({Key? key, required this.conn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.all(5),
        filled: true,
        fillColor: Colors.white,
      ),
      controller: conn,
    );
  }
}
