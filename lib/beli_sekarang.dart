import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_button/counter_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/pembayaran_selesai.dart';
import 'package:flutter_application_1/pilih_metode.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BeliSekarang extends StatefulWidget {
  const BeliSekarang({Key? key}) : super(key: key);

  @override
  State<BeliSekarang> createState() => _BeliSekarangState();
}

int _counterValue = 0;
var kali;
var barang;
var total;
var harga;
var alamat;
var imageUrl;
var metode;

class _BeliSekarangState extends State<BeliSekarang> {
  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("barang").doc(docID);
    return docRef.get();
  }

  Future<DocumentSnapshot<Object?>> getUser(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("user").doc(docID);
    return docRef.get();
  }

  Future<DocumentSnapshot<Object?>> GetMetode(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("checkout").doc(docID);
    return docRef.get();
  }

  final email = FirebaseAuth.instance.currentUser!.email;
  final id = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    var user = FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: email)
        .snapshots();

    return FutureBuilder<DocumentSnapshot<Object?>>(
        future: getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          var documentSnapshot = snapshot.data!.data();
          harga = (documentSnapshot as Map<String, dynamic>)['harga'];
          var castHarga = "${harga}";
          var castHarga2 = int.parse(castHarga);
          kali = _counterValue * castHarga2;
          total = (kali) + 10000;
          barang =
              "${(documentSnapshot as Map<String, dynamic>)['nama_barang']}";
          alamat = "${(documentSnapshot as Map<String, dynamic>)['alamat']}";
          imageUrl = "${(documentSnapshot as Map<String, dynamic>)['image']}";

          print(harga);
          print(documentSnapshot);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: const Color(0xff3A8C6E),
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                color: Colors.white,
                                icon: Icon(Icons.arrow_back_outlined)),
                            Text(
                              "Checkout",
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
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(width: 10),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          "${(documentSnapshot as Map<String, dynamic>)['image']}"),
                                    ),
                                    SizedBox(width: 50),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${(documentSnapshot as Map<String, dynamic>)['nama_barang']}",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Rp ${(documentSnapshot as Map<String, dynamic>)['harga']}",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12,
                                                color: Color(0xff73BE12),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("jumlah barang",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 30),
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
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("Total Harga",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 140),
                                        Text("Rp ${kali}",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12,
                                                color: Color(0xff73BE12),
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Color(0xffABABAE),
                                  thickness: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Alamat Pengiriman",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text("ganti alamat",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w100)))
                                  ],
                                ),
                                StreamBuilder(
                                    stream: user,
                                    builder: (context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.white),
                                        );
                                      }
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            final DocumentSnapshot userdoc =
                                                snapshot.data!.docs[index];
                                            return Text("${userdoc['alamat']}");
                                          });
                                    }),
                                Divider(
                                  color: Color(0xffABABAE),
                                  thickness: 4,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Opsi Pengiriman",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text("JNE",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Biaya Pengiriman"),
                                        Text("Rp 10.000",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Color(0xff73BE12),
                                                fontWeight: FontWeight.bold))
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  color: Color(0xffABABAE),
                                  thickness: 4,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Metode Pembayaran",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        Text("COD"),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(
                                  color: Color(0xffABABAE),
                                  thickness: 4,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Subtotal untuk Produk",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100)),
                                    Text("Rp ${kali}",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Color(0xffBEC3B6),
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Subtotal Pengiriman",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w100)),
                                    Text("Rp 10.000",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Color(0xffBEC3B6),
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Pembayaran",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text("Rp ${total}",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            color: Color(0xff73BE12),
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Divider(
                                  color: Color(0xffABABAE),
                                  thickness: 4,
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Total Pembayaran",
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 5),
                                        Text(
                                          "Rp ${total}",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 16,
                                              color: Color(0xff73BE12),
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    TextButton(
                                        onPressed: () {
                                          addKeranjang();
                                          Get.to(() => BayarSelesai(),
                                              arguments: snapshot.data!.id);
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor: Color(0xff3A8C6E),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            )),
                                        child: Text("Checkout",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontFamily: "poppins")))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }

  void addKeranjang() async {
    try {
      var collection = FirebaseFirestore.instance.collection('checkout');

      var res = await collection.add({
        'nama_barang': barang,
        'harga': harga,
        'Total Harga': total,
        'alamat': alamat,
        'image': imageUrl,
        'jumlah': _counterValue
      });
      print('berhasil ditambahkan');
      print(res);
    } catch (e) {
      print("gagal ditambahkan");
    }
  }
}
