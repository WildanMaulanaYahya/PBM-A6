import 'package:flutter_application_1/abouttheapp.dart';
import 'package:flutter_application_1/edit_profil.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_1/Logout.dart';
import 'package:cool_alert/cool_alert.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  showAlert() async {
    Alert(
            context: context,
            title: "RFLUTTEasdasdR",
            desc: "Flutadasdasdter is awesome.")
        .show();
  }

  @override
  Widget build(BuildContext context) {
    return const NewWidget();
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xff3A8C6E),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'images/profil.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Wildan Maulana",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xffFCD857),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditProfile()));
                          },
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Popins",
                            ),
                          ))
                    ],
                  )
                ]),
                const SizedBox(height: 40),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: const Text(
                        "History",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: const Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: const Text(
                        "My Order",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Abouttheapp()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: const Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: const Text(
                        "About the app",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.confirm,
                          backgroundColor:
                              const Color.fromARGB(255, 175, 221, 243),
                          title: 'apakah anda yakin ingin logout?',
                          onConfirmBtnTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()),
                            );
                          },
                          onCancelBtnTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Profile()),
                            );
                          },
                          cancelBtnTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 221, 29, 29)),
                          confirmBtnColor:
                              const Color.fromARGB(255, 136, 225, 139),
                          confirmBtnTextStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0)),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: const Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

void showAlert() {}
