// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_barang.dart';
import 'package:flutter_application_1/choice.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/signup.dart';
// import 'package:flutter_application_1/widget/costum_textfield.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var show_password = false;
  var err_msg = '';
  var contr_email = TextEditingController();
  var contr_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff3A8C6E),
        body: SingleChildScrollView(
          child: Form(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Align(
                    alignment: FractionalOffset(0.2, 0.6),
                    child: SizedBox(
                      width: 260,
                      child: Text('Cari Bibit Berkualitas Bersama Metabit app',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                              fontSize: 16)),
                    ),
                  ),
                  Align(
                      alignment: const FractionalOffset(0.9, 0.1),
                      child: Image.asset(
                        'images/login.png',
                        scale: 0.8,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(35))),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 259),
                            child: Text(
                              "Masuk",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            style: const TextStyle(
                                fontFamily: "Poppins", fontSize: 15),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Email',
                            ),
                            controller: contr_email,
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            style: const TextStyle(
                                fontFamily: "Poppins", fontSize: 15),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      show_password = !show_password;
                                    });
                                  },
                                  icon: const Icon(Icons.visibility),
                                )),
                            obscureText: show_password == false,
                            controller: contr_password,
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 200),
                            child: Text("Lupa Password ?",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 13,
                                    color: Color(0xff8F8F8F))),
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            onPressed: () {
                              _signin();
                            },
                            inputText: 'Sign In',
                            color: const Color(0xff3A8C6E),
                            textcolor: Colors.white,
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SignUp();
                                }));
                              },
                              child: const Text("Or Sign Up Here",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 13,
                                      color: Color(0xff8F8F8F))))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void next_screen(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success!",
        text: "Berhasil Login",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Choice()),
          );
        });
  }

  void alert_salah(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Terjadi Kesalahan",
        text: "Email atau Password salah",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.pop(context);
        });
  }

  void _signin() async {
    try {
      var emailAddress = contr_email.text;
      var password = contr_password.text;
      var credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print('proccess');
      var cb = credential.user!.uid;
      print(cb);
      print(credential);
      print('berhasil');
      next_screen(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == null) {
        alert_salah(context);
      }
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        alert_salah(context);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        alert_salah(context);
      }
      ;
    }
  }
}
