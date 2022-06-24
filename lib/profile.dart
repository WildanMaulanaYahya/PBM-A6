import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/abouttheapp.dart';
import 'package:flutter_application_1/edit_profil.dart';
import 'package:flutter_application_1/sign_in.dart';
import 'package:flutter_application_1/widget/costum_button_profile.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return NewWidget();
  }
}

class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
  }) : super(key: key);

  final email = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: email)
        .snapshots();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xff3A8C6E),
          body: StreamBuilder(
              stream: users,
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                print(streamSnapshot);
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                        return SafeArea(
                          child: Column(
                            children: [
                              const SizedBox(height: 50),
                              Row(children: [
                                const SizedBox(width: 30),
                                ClipOval(
                                  child: Image.network(
                                    "${documentSnapshot['image']}",
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                    color: const Color.fromARGB(
                                        208, 129, 129, 129),
                                    colorBlendMode: BlendMode.modulate,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${documentSnapshot['nama_lengkap']}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Popins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xffFCD857),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        onPressed: () => Get.to(
                                            () => EditProfile(),
                                            arguments: documentSnapshot.id),
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
                                        builder: (context) =>
                                            const Abouttheapp()),
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
                                      backgroundColor: const Color.fromARGB(
                                          255, 175, 221, 243),
                                      text: 'apakah anda yakin ingin logout?',
                                      onConfirmBtnTap: () {
                                        _signOut();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignIn()),
                                        );
                                      },
                                      onCancelBtnTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      },
                                      cancelBtnTextStyle: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 221, 29, 29)),
                                      confirmBtnColor: const Color.fromARGB(
                                          255, 136, 225, 139),
                                      confirmBtnTextStyle: const TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0)),
                                    );
                                  })
                            ],
                          ),
                        );
                      });
                }
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }),
        ));
  }

  void _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('berhasil');
    } catch (e) {
      print("gagal logout");
    }
  }
}
