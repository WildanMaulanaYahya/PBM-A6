import 'package:flutter_application_1/abouttheapp.dart';
import 'package:flutter_application_1/edit_profil.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/widget/costum_button_profile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cool_alert/cool_alert.dart';

import 'package:flutter/material.dart';

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
                CustomButton3(
                  icon: Icons.watch_later_outlined,
                  text: 'History',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                CustomButton3(
                  icon: Icons.local_shipping_outlined,
                  text: 'My Order',
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                CustomButton3(
                  icon: Icons.local_shipping_outlined,
                  text: 'About the app',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Abouttheapp()),
                    );
                  },
                ),
                const SizedBox(height: 20),
                CustomButton3(
                    icon: Icons.logout,
                    text: 'Logout',
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
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        cancelBtnTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 221, 29, 29)),
                        confirmBtnColor:
                            const Color.fromARGB(255, 136, 225, 139),
                        confirmBtnTextStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0)),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}

void showAlert() {}
