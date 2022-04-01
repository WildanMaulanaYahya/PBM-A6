// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                ])
              ],
            ),
          ),
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
                iconSize: 40,
              ),
              IconButton(
                  icon: const Icon(Icons.shopping_bag_rounded),
                  onPressed: () {},
                  iconSize: 40),
              IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {},
                  iconSize: 40)
            ],
          ),
        ));
  }
}
