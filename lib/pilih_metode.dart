import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/beli_sekarang.dart';
import 'package:get/get.dart';

class Metode extends StatefulWidget {
  const Metode({Key? key}) : super(key: key);

  @override
  State<Metode> createState() => _MetodeState();
}

class _MetodeState extends State<Metode> {
  String value = '';

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("checkout").doc(docID);
    return docRef.get();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xff3A8C6E),
          body: FutureBuilder<DocumentSnapshot<Object?>>(
              future: getData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.to(() => BeliSekarang(),
                                      arguments: snapshot.data!.id);
                                },
                                color: Colors.white,
                                icon: Icon(Icons.arrow_back_outlined)),
                            Text(
                              "Metode Pembayaran",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset('images/box.png'),
                                    ),
                                    Text("COD",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 200),
                                    Radio<String>(
                                      activeColor: Colors.black,
                                      value: "COD",
                                      groupValue: value,
                                      onChanged: _handleChange,
                                    ),
                                  ]),
                                  Divider(
                                    color: Color(0xffABABAE),
                                    thickness: 3,
                                  ),
                                  Row(children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Image.asset('images/indomaret.png'),
                                    ),
                                    Text("Indomaret",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(width: 152),
                                    Radio<String>(
                                      activeColor: Colors.black,
                                      value: "Indomaret",
                                      groupValue: value,
                                      onChanged: _handleChange,
                                    ),
                                  ]),
                                  Divider(
                                    color: Color(0xffABABAE),
                                    thickness: 3,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }

  void _handleChange(String? _value) {
    setState(() {
      value = _value!;
    });
    pilihMetode(Get.arguments);
  }

  void pilihMetode(String id) async {
    DocumentReference docdata =
        FirebaseFirestore.instance.collection('metode').doc(id);
    print(docdata);
    try {
      await docdata.set({"metode_pembayaran": value}, SetOptions(merge: true));
      print("berhasil");
    } catch (e) {
      print("Error updating");
    }
  }
}
