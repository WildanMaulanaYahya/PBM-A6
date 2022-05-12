import 'package:flutter/material.dart';

class CostumTextField2 extends StatelessWidget {
  final String isi;
  final String judul;
  const CostumTextField2({Key? key, required this.judul, required this.isi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(judul,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: "poppins",
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextField(
          style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: isi,
          ),
        ),
      ],
    );
  }
}
