import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbahGender extends StatefulWidget {
  UbahGender({Key? key}) : super(key: key);

  @override
  State<UbahGender> createState() => _UbahGenderState();
}

class _UbahGenderState extends State<UbahGender> {
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("user").doc(docID);
    return docRef.get();
  }

  var controller = TextEditingController();
  String _genderRadioBtnVal = '';

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
                              Get.back();
                            },
                            icon: const Icon(Icons.arrow_back_rounded),
                          ),
                          const SizedBox(width: 10),
                          const Text('Ubah Gender',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 140),
                          TextButton(
                              onPressed: () {
                                print(controller.text);
                                addGender(Get.arguments);
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Laki - Laki',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 200),
                                      Radio<String>(
                                        activeColor: Colors.black,
                                        value: "Laki - Laki",
                                        groupValue: _genderRadioBtnVal,
                                        onChanged: _handleGenderChange,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Text(
                                        'Perempuan',
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(width: 185),
                                      Radio<String>(
                                        activeColor: Colors.black,
                                        value: "Perempuan",
                                        groupValue: _genderRadioBtnVal,
                                        onChanged: _handleGenderChange,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ));
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      _genderRadioBtnVal = value!;
    });
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
          controller.clear();
          Navigator.of(context, rootNavigator: true).pop();
          Get.back();
          Get.back();
        });
  }

  void alert_salah(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Terjadi kesalahan",
        text: "Tidak berhasil mengubah data nama",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.pop(context);
          Get.back();
          Get.back();
        });
  }

  void addGender(String docID) async {
    DocumentReference docdata =
        FirebaseFirestore.instance.collection('user').doc(docID);

    try {
      await docdata
          .set({"gender": _genderRadioBtnVal}, SetOptions(merge: true));
      alert_berhasil(context);
    } catch (e) {
      alert_salah(context);
    }
  }
}
