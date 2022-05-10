import 'package:flutter/material.dart';
import 'package:flutter_application_1/barang.dart';
import 'package:flutter_application_1/widget/bintang2.dart';
import 'package:flutter_application_1/widget/bintang3.dart';
import 'package:flutter_application_1/widget/bintang4.dart';
import 'package:flutter_application_1/widget/costum_card_home.dart';

import 'filter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(appBarTheme: const AppBarTheme(color: Color(0xff3A8C6E))),
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
                        height: 72,
                        width: 168,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '''Hallo Wildan, 
Mau Belanja Bibit Tanaman apa hari ini ? ''',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Image.asset('images/home.png')
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const <Widget>[
                            CostumCardHome(
                                nameImage: 'biji1.png',
                                name: 'Biji 1',
                                harga: 'Rp 50.000'),
                            Bintang3()
                          ],
                        ),
                        Column(
                          children: const <Widget>[
                            CostumCardHome(
                                nameImage: 'biji2.png',
                                name: 'Biji 2',
                                harga: 'Rp 50.000'),
                            Bintang3()
                          ],
                        ),
                        Column(
                          children: const <Widget>[
                            CostumCardHome(
                                nameImage: 'biji3.png',
                                name: 'Biji 3',
                                harga: 'Rp 50.000'),
                            Bintang4()
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xffABABAE),
                      thickness: 4,
                      indent: 30,
                      endIndent: 30,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Barang()),
                            );
                          },
                          child: Column(
                            children: const <Widget>[
                              CostumCardHome(
                                  nameImage: 'biji4.png',
                                  name: 'Biji 4',
                                  harga: 'Rp 50.000'),
                              Bintang4()
                            ],
                          ),
                        ),
                        Column(
                          children: const <Widget>[
                            CostumCardHome(
                                nameImage: 'biji5.png',
                                name: 'Biji 5',
                                harga: 'Rp 50.000'),
                            Bintang4()
                          ],
                        ),
                        Column(
                          children: const <Widget>[
                            CostumCardHome(
                                nameImage: 'biji6.png',
                                name: 'Biji 6',
                                harga: 'Rp 50.000'),
                            Bintang2()
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Color(0xffABABAE),
                      thickness: 4,
                      indent: 30,
                      endIndent: 30,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
