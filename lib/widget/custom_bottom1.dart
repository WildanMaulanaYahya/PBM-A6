import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final GestureTapCallback onPressed;
  final dynamic color;
  final dynamic textcolor;

  const CustomButton(
      {Key? key,
      required this.inputText,
      required this.onPressed,
      this.textcolor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          onPressed: onPressed,
          child: Text(
            inputText,
            style: TextStyle(
                fontSize: 16, color: textcolor, fontFamily: "poppins"),
          )),
    );
  }
}
