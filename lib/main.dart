// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Logout.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/chat.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/ubah_alamat.dart';

import 'add_to_cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cart(),
    );
  }
}
