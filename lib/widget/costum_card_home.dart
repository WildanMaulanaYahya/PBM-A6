import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/bintang2.dart';
import 'package:flutter_application_1/widget/bintang3.dart';

class CostumCardHome extends StatelessWidget {
  final nameImage;
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
        Container(
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              nameImage,
              fit: BoxFit.cover,
            ),
          ),
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
