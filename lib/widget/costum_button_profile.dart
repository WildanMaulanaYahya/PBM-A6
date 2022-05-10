import 'package:flutter/material.dart';

class CustomButton3 extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onPressed;
  const CustomButton3(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(fontFamily: "Poppins", fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
