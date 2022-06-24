// ignore_for_file: unnecessary_const, avoid_print, non_constant_identifier_names

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_application_1/bottom_navigation_bar.dart';
import 'package:flutter_application_1/sign_in.dart';
// import 'package:flutter_application_1/widget/costum_textfield.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var dateinput = TextEditingController();
  var ctrlemail = TextEditingController();
  var ctrlpass = TextEditingController();
  var ctrlname = TextEditingController();
  var ctrlphn = TextEditingController();
  var show_password = false;
  var _image =
      "https://firebasestorage.googleapis.com/v0/b/pbm-a6.appspot.com/o/profile%2Fprofil.png?alt=media&token=e03e6cab-bbc3-40f5-9b34-d0ba3e13b6b8";

  var nama = '';
  var nohp = '';
  var formattedDate = '';
  var email = '';
  var pass = '';
  var alamat = 'belum diatur';

  final _formKey = GlobalKey<FormState>();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form(
        key: _formKey,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff3A8C6E),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(right: 60),
                  child: const Text('''Temukan Penjualan Bibit Terbaik.
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
                const SizedBox(height: 10),
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(35))),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Padding(
                        padding: EdgeInsets.only(right: 250),
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: ctrlname,
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Nama Lengkap',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'nama tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            nama = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: ctrlphn,
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'No Telepon',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'No Telepon tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            nohp = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Tanggal Lahir (yyyy-mm-dd)',
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    await datePicker(context);
                                  },
                                  icon: const Icon(
                                      Icons.calendar_month_outlined))),
                          controller: dateinput,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tanggal lahir tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            formattedDate = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: ctrlemail,
                          style: const TextStyle(
                              fontFamily: "Poppins", fontSize: 15),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: ctrlpass,
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            if (value.length < 6) {
                              return 'Password harus lebih dari 6 karakter';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            pass = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _signup();
                            _add_user();
                          }
                        },
                        inputText: 'Sign Up',
                        color: const Color(0xff3A8C6E),
                        textcolor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  Future<void> datePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: const Color(0xff3A8C6E),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.black,
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime.now());

    if (pickedDate != null) {
      print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      print(formattedDate);

      setState(() {
        dateinput.text = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  void berhasil(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success!",
        text: "Pendaftaran Berhasil",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return BottomNav();
          }));
        });
  }

  void _signup() async {
    try {
      var email = ctrlemail.text;
      var password = ctrlpass.text;
      var res = FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print(res);
      print('Berhasil daftar');
      berhasil(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Password should be at least 6 characters');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _add_user() async {
    var collection = FirebaseFirestore.instance.collection('user');

    var res = await collection.add({
      'nama_lengkap': nama,
      'no_telepon': nohp,
      'tgl_lahir': formattedDate,
      'email': email,
      'alamat': alamat,
      'image': _image,
    });
    print('berhasil ditambahkan');
    print(res);
  }
}
