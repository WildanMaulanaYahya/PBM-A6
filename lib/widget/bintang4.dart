import 'package:flutter/material.dart';

class Bintang4 extends StatelessWidget {
  const Bintang4({Key? key}) : super(key: key);

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
        Icon(
          Icons.star_rate,
          color: Color(0xffFFD233),
        ),
        Icon(
          Icons.star_rate,
          color: Color(0xffFFD233),
        )
      ],
    );
  }
}
