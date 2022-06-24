import 'package:flutter/material.dart';

class Bintang1 extends StatelessWidget {
  const Bintang1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star_rate,
          color: Color(0xffFFD233),
        ),
      ],
    );
  }
}
