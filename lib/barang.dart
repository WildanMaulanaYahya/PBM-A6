import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/beli_sekarang.dart';
import 'package:flutter_application_1/review.dart';
import 'package:flutter_application_1/widget/bintang1.dart';
import 'package:flutter_application_1/widget/bintang2.dart';
import 'package:flutter_application_1/widget/bintang3.dart';
import 'package:flutter_application_1/widget/bintang4.dart';
import 'package:flutter_application_1/widget/bintang5.dart';
import 'package:get/get.dart';

import 'add_to_cart.dart';
import 'chat.dart';

class Barang extends StatefulWidget {
  Barang({Key? key}) : super(key: key);

  @override
  State<Barang> createState() => _BarangState();
}

class _BarangState extends State<Barang> {
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("barang").doc(docID);
    return docRef.get();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder<DocumentSnapshot<Object?>>(
            future: getData(Get.arguments),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
              var documentSnapshot = snapshot.data!.data();
              print(documentSnapshot);

              return Column(children: [
                Stack(
                  children: [
                    Image.network(
                      '${(documentSnapshot as Map<String, dynamic>)['image']}',
                      scale: 0.1,
                    ),
                    Positioned(
                      top: 30,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${(documentSnapshot as Map<String, dynamic>)['nama_barang']}',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Stok ${(documentSnapshot as Map<String, dynamic>)['stok']}",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                '${(documentSnapshot as Map<String, dynamic>)['toko']}',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Rp ${(documentSnapshot as Map<String, dynamic>)['harga']}',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff4f9E2A)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Color(0xffABABAE),
                        thickness: 4,
                        endIndent: 3,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '''${(documentSnapshot as Map<String, dynamic>)['Deskripsi']}''',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ]);
            }),
        bottomNavigationBar: FutureBuilder<DocumentSnapshot<Object?>>(
            future: getData(Get.arguments),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              }
              var documentSnapshot = snapshot.data!.data();
              print(documentSnapshot);
              return BottomAppBar(
                  child: Container(
                      color: const Color(0xffFCD857),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              TextButton(
                                onPressed: () => Get.to(() => Review(),
                                    arguments: snapshot.data!.id),
                                child: const Text(
                                  'Review',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                      fontSize: 14),
                                ),
                              ),
                              const SizedBox(width: 30),
                              IconButton(
                                  onPressed: () => Get.to(() => Chat(),
                                      arguments: snapshot.data!.id),
                                  icon: const Icon(Icons.chat_bubble_outline)),
                              const SizedBox(width: 30),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return const AddtoCart();
                                        });
                                  },
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined)),
                              const SizedBox(width: 30),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              color: const Color(0xff3A8C6E),
                              width: 132,
                              child: TextButton(
                                onPressed: () => Get.to(() => BeliSekarang(),
                                    arguments: snapshot.data!.id),
                                child: const Text(
                                  'Beli Sekarang',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )));
            }),
      ),
    );
  }
}
