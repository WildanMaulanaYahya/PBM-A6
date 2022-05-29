// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_application_1/widget/costum_textfield.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text('''Temukan Penjualan Bibit Terbaik.
Semua Bibit Berkualitass.''',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Image.asset(
                'images/signup.png',
                height: 100,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35))),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(right: 250),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const CostumTextField(hintText: 'Nama Lengkap'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const CostumTextField(hintText: 'No Telepon'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Tanggal Lahir',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(1990, 3, 5),
                                        maxTime: DateTime(2019, 6, 7),
                                        onChanged: (date) {
                                      print('change $date');
                                    }, onConfirm: (date) {
                                      print('confirm $date');
                                    },
                                        currentTime: DateTime.now(),
                                        locale: LocaleType.id);
                                  },
                                  icon: Icon(Icons.calendar_month_outlined))),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const CostumTextField(hintText: 'Email'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Password',
                              suffixIcon: const Icon(Icons.visibility)),
                        ),
                      ),
                      SizedBox(height: 30),
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
