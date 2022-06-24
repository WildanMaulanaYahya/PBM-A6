import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_textfield_3.dart';
import 'package:get/get.dart';

class UbahNoHP extends StatefulWidget {
  UbahNoHP({Key? key}) : super(key: key);

  @override
  State<UbahNoHP> createState() => _UbahNoHPState();
}

class _UbahNoHPState extends State<UbahNoHP> {
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
                controller.text = data["no_telepon"];
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
                          const Text('Ubah no hp',
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(width: 140),
                          TextButton(
                              onPressed: () =>
                                  _editnoHp(controller.text, Get.arguments),
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
                          padding: EdgeInsets.all(20),
                          child: CustomTextField3(conn: controller),
                        ),
                      ),
                    ),
                  ],
                ));
              }
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }),
      ),
    );
  }

  void alert_berhasil(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success",
        text: "Berhasil mengubah no Telepon",
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
        text: "Tidak berhasil mengubah no Telepon",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.pop(context);
        });
  }

  void _editnoHp(String nama, String docID) async {
    DocumentReference docdata =
        FirebaseFirestore.instance.collection('user').doc(docID);
    try {
      await docdata.update({"no_telepon": nama});
      alert_berhasil(context);
    } catch (e) {
      alert_salah(context);
    }
  }
}
