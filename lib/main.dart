// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Logout.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/chat.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/edit_profil.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/location/location_provider.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/ubah_alamat.dart';
import 'package:flutter_application_1/ubah_email.dart';
import 'package:flutter_application_1/ubah_gender.dart';
import 'package:flutter_application_1/ubah_nama.dart';
import 'package:flutter_application_1/ubah_nohp.dart';
import 'package:provider/provider.dart';
import 'add_to_cart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => LocationProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (context, snapshot) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
      );
    });
  }
}
