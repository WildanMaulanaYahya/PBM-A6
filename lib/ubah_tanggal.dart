// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_textfield_3.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UbahTanggal extends StatefulWidget {
  UbahTanggal({Key? key}) : super(key: key);

  @override
  State<UbahTanggal> createState() => _UbahTanggalState();
}

class _UbahTanggalState extends State<UbahTanggal> {
  TextEditingController dateinput = TextEditingController();
  var controller = TextEditingController();

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("user").doc(docID);
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
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data?.data() as Map<String, dynamic>;
                dateinput.text = data["tgl_lahir"];
                return SafeArea(
                    child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                          const SizedBox(width: 10),
                          const Text('Ubah Tanggal',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 140),
                          TextButton(
                              onPressed: () {
                                _editTgl(dateinput.text, Get.arguments);
                              },
                              child: const Text('Simpan',
                                  style: TextStyle(
                                    color: Color(0xff3A8C6E),
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                  )))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0xffF2F1F1),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: 'Tanggal Lahir (yyyy-mm-dd)',
                                suffixIcon:
                                    Icon(Icons.calendar_month_outlined)),
                            controller: dateinput,
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }

  void alert_berhasil(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success",
        text: "Berhasil mengubah data nama",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          dateinput.clear();
          Navigator.of(context, rootNavigator: true).pop();
          Get.back();
        });
  }

  void alert_salah(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Terjadi kesalahan",
        text: "Tidak berhasil mengubah tanggal lahir",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.pop(context);
        });
  }

  void _editTgl(String tgl, String docID) async {
    DocumentReference docdata =
        FirebaseFirestore.instance.collection('user').doc(docID);
    try {
      await docdata.update({"tgl_lahir": tgl});
      alert_berhasil(context);
    } catch (e) {
      alert_salah(context);
    }
  }
}
