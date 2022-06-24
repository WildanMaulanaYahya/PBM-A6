// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
import 'package:get/get.dart';

class AddtoCart extends StatefulWidget {
  const AddtoCart({Key? key}) : super(key: key);

  @override
  State<AddtoCart> createState() => _AddtoCart();
}

class _AddtoCart extends State<AddtoCart> {
  int _counterValue = 0;

  @override
  void initState() {
    super.initState();
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("barang").doc(docID);
    return docRef.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }
          var documentSnapshot = snapshot.data!.data();
          print(documentSnapshot);

          return SizedBox(
            height: 314,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        "${(documentSnapshot as Map<String, dynamic>)['image']}",
                        width: 138,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp ${(documentSnapshot as Map<String, dynamic>)['harga']}",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff4F9E2A),
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Stock: ${(documentSnapshot as Map<String, dynamic>)['stok']}',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 11,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Jumlah"),
                      Column(
                        children: [
                          Text('Qty'),
                          CounterButton(
                            loading: false,
                            onChange: (int val) {
                              setState(() {
                                _counterValue = val;
                              });
                            },
                            count: _counterValue,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 270,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff3A8C6E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: Text(
                          'Masukkan Keranjang',
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          );
        });
  }
}
