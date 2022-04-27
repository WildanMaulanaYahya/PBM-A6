import 'package:flutter/material.dart';

class UbahAlamat extends StatelessWidget {
  const UbahAlamat({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
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
                        child: Text("Ubah Alamat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 20)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 300.0),
                    child: Text("Alamat",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 370,
                    child: TextField(
                      style:
                          const TextStyle(fontFamily: "Poppins", fontSize: 15),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Masukkan Alamat',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 170.0, top: 20),
                    child: Text("Kota atau Kecamatan",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 370,
                    child: TextField(
                      style:
                          const TextStyle(fontFamily: "Poppins", fontSize: 15),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Masukkan Kota atau Kecamatan',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 290.0, top: 30),
                    child: Text("Kode Pos",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 370,
                    child: TextField(
                      style:
                          const TextStyle(fontFamily: "Poppins", fontSize: 15),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Masukkan Kode Pos',
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff88E18B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        )),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 370,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xffFF0606),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onPressed: () {},
                        child: const Text(
                          "Hapus Alamat",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        )),
                  ),
                ],
              ),
            )));
  }
}
