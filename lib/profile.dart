// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Logout.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                SizedBox(height: 50),
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
                      Text(
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
                          onPressed: () {},
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
                SizedBox(height: 40),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Text(
                        "History",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Text(
                        "My Order",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Text(
                        "About the app",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 320,
                  height: 50,
                  child: TextButton.icon(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black,
                        size: 30,
                      ),
                      label: Text(
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
