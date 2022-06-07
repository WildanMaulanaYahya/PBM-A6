import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final String hintText;
  final controller;
  final validator;

  CostumTextField(
      {Key? key, required this.hintText, this.controller, this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
