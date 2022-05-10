import 'package:flutter/material.dart';

class Bintang2 extends StatelessWidget {
  const Bintang2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star_rate,
          color: Color(0xffFFD233),
        ),
        Icon(
          Icons.star_rate,
          color: Color(0xffFFD233),
        ),
      ],
    );
  }
}
