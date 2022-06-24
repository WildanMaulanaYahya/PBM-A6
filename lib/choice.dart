import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_barang.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/sign_in.dart';

class Choice extends StatelessWidget {
  const Choice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xff3A8C6E),
          body: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 20),
              child: Text("Pilih Login Sebagai",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 25)),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('images/logo.jpeg'),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: 80,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff336452),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddBarang()),
                          );
                        },
                        child: const Text(
                          "Penjual",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
                SizedBox(width: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: SizedBox(
                    width: 90,
                    height: 40,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff336452),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BottomNav()),
                          );
                        },
                        child: const Text(
                          "Pembeli",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
