import 'package:flutter/material.dart';

class CostumCardHome extends StatelessWidget {
  final dynamic nameImage;
  final String name;
  final String harga;

  const CostumCardHome(
      {Key? key,
      required this.nameImage,
      required this.name,
      required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset('images/' + nameImage),
        ),
        Text(name,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
            )),
        Text(harga,
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff4F9E2A))),
      ],
    );
  }
}
