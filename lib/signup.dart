// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_application_1/widget/costum_textfield.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff3A8C6E),
        body: SafeArea(
            child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 100, 10),
              child: Text('''Temukan Penjualan Bibit Terbaik.
Semua Bibit Berkualitass.''',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(230, 10, 0, 30),
              child: Image.asset(
                'images/signup.png',
                scale: 1,
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35))),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 300, 10),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                          child:
                              const CostumTextField(hintText: 'Nama Lengkap')),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                          child: const CostumTextField(hintText: 'No Telepon')),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 15),
                          child: const CostumTextField(hintText: 'Email')),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                              suffixIcon: const Icon(Icons.visibility)),
                        ),
                      ),
                      CustomButton(
                        onPressed: () {
                          CoolAlert.show(
                              context: context,
                              type: CoolAlertType.success,
                              title: "Success!",
                              text: "Pendaftaran Berhasil",
                              backgroundColor:
                                  const Color.fromARGB(255, 154, 195, 180),
                              confirmBtnColor: const Color(0xff3A8C6E),
                              onConfirmBtnTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const BottomNav();
                                }));
                              });
                        },
                        inputText: 'Sign Up',
                        color: const Color(0xff3A8C6E),
                        textcolor: Colors.white,
                      ),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
