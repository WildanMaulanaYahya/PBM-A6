import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter_button/counter_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _counterValue = 0;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance
        .collection("cart")
        .where("uid", isEqualTo: uid)
        .snapshots();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Keranjang Saya",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            fontSize: 18)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              StreamBuilder(
                  stream: users,
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              "${documentSnapshot['image']}",
                                              scale: 0.7,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            const SizedBox(height: 15),
                                            Text(
                                              "${documentSnapshot['nama']}",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                                "Rp ${documentSnapshot['harga']}",
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    color: Color(0xff73BE12),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            const SizedBox(height: 5),
                                            const Text('Qty'),
                                            const SizedBox(height: 5),
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
                                        Checkbox(
                                            checkColor: Colors.black,
                                            activeColor:
                                                const Color(0xffE5E5E5),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            })
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              delete();
                                            },
                                            icon: const Icon(
                                                Icons.clear_rounded)),
                                        const Text("Hapus")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                    return Center(
                        child: CircularProgressIndicator(color: Colors.white));
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600),
                          ),
                          Text("harga",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff73BE12))),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              checkColor: Colors.black,
                              activeColor: const Color(0xffE5E5E5),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text("Semua",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150),
                        child: CustomButton(
                          inputText: 'Checkout',
                          onPressed: () {},
                          color: const Color(0xff3A8C6E),
                          textcolor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void delete() async {
    CollectionReference cart = FirebaseFirestore.instance.collection('cart');

    Future<void> deleteUser() {
      return cart
          .doc(uid)
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }
  }
}
