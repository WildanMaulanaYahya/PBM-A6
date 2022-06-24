import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/barang.dart';
import 'package:flutter_application_1/widget/costum_card_home.dart';
import 'package:get/get.dart';

import 'filter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final email = FirebaseAuth.instance.currentUser!.email;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var barang = FirebaseFirestore.instance.collection("barang").snapshots();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xff3A8C6E))),
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            backgroundColor: const Color(0xff3A8C6E),
            appBar: AppBar(
              toolbarHeight: 80,
              title: Container(
                width: double.infinity,
                height: 34,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: TextField(
                  style: const TextStyle(fontFamily: "Poppins", fontSize: 12),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.all(0),
                      hintText: 'Ayo Cari Bibitmu',
                      prefixIcon: const Icon(Icons.search)),
                )),
              ),
              elevation: 0.0,
              leading: Container(
                margin: const EdgeInsets.only(top: 6),
                child: Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: Image.asset('images/filter.png'),
                    );
                  },
                ),
              ),
            ),
            drawer: const Filter(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            height: MediaQuery.of(context).size.height * 0.10,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hallo,",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "Mau Belanja Bibit Tanaman apa hari ini ? ",
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ),
                          Image.asset('images/home.png')
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: StreamBuilder(
                          stream: barang,
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            if (streamSnapshot.hasData) {
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: streamSnapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot documentSnapshot =
                                        streamSnapshot.data!.docs[index];
                                    return InkWell(
                                      onTap: () => Get.to(() => Barang(),
                                          arguments: documentSnapshot.id),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Column(
                                          children: [
                                            CostumCardHome(
                                                nameImage:
                                                    "${documentSnapshot["image"]}",
                                                name:
                                                    "${documentSnapshot["nama_barang"]}",
                                                harga:
                                                    "Rp ${documentSnapshot["harga"]}"),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            ));
                          }),
                    ),
                  ),
                ],
              ),
            )));
  }
}
