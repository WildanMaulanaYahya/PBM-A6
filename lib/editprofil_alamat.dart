import 'package:flutter/material.dart';
import 'package:flutter_application_1/ubah_alamat.dart';

class EditProfilAlamat extends StatelessWidget {
  const EditProfilAlamat({Key? key}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
                backgroundColor: const Color(0xff3A8C6E),
                body: Column(children: [
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
                        width: 110,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text("Alamat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 18)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 150),
                    child: Text("+ Tambah Alamat",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Poppins',
                            fontSize: 18)),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Padding(
                              padding: EdgeInsets.only(right: 240),
                              child: Text(
                                "Alamat Utama",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: "poppins",
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                const Text("Jl. Mangga III No 17, RT 06 RW 07",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "poppins",
                                    )),
                                const SizedBox(
                                  width: 30,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffC4C4C4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UbahAlamat()),
                                      );
                                    },
                                    child: const Text(
                                      "Ubah",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "poppins",
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: const [
                                Text('''Kelurahan Bedali, Kecamatan Lawang, 
Jawa Timur, 60256''',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: "poppins",
                                    )),
                              ],
                            ),
                          ),
                        ]),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  const Text(
                                      '''Jl. Tanjung Pinang III No 17, RT 06 
RW 07''',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "poppins",
                                      )),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffC4C4C4),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      onPressed: () {},
                                      child: const Text(
                                        "Ubah",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontFamily: "poppins",
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: const [
                                  Text('''Kota Tanjung Pinang, Kepulauan Riau, 
29123''',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "poppins",
                                      )),
                                ],
                              ),
                            ),
                          ])))
                ]))));
  }
}
