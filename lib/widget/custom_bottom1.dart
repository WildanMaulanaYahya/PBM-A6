import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String inputText;
  final GestureTapCallback onPressed;

  const CustomButton(
      {Key? key, required this.inputText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xff3A8C6E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: onPressed,
          child: Text(
            inputText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )),
    );
  }
}
