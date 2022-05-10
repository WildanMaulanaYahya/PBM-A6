import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final String hintText;

  const CostumTextField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
        ));
  }
}
