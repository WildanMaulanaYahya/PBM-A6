// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({Key? key}) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCart();
}

class _AddtoCart extends State<AddtoCart> {
  int _counterValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 314,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/biji4_pagebarang.png',
                  width: 138,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp 50.000',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          color: Color(0xff4F9E2A),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Stock: 999',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 11,
                      ),
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Jumlah"),
                Column(
                  children: [
                    Text('Qty'),
                    CounterButton(
                      loading: false,
                      onChange: (int val) {
                        setState(() {
                          _counterValue = val;
                        });
                      },
                      count: _counterValue,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 270,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff3A8C6E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Masukkan Keranjang',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
