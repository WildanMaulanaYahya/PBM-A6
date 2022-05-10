import 'package:flutter/material.dart';

class CostumButton2 extends StatelessWidget {
  final String nama;
  final String ket;
  final GestureTapCallback onPressed;
  final double width;

  const CostumButton2(
      {Key? key,
      required this.nama,
      required this.ket,
      required this.onPressed,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
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
            Text(
              nama,
              style: const TextStyle(fontFamily: "Poppins"),
            ),
            SizedBox(width: width),
            Text(
              ket,
              style: const TextStyle(fontFamily: "Poppins"),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
