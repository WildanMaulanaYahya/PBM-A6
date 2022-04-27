import 'package:flutter/material.dart';

class UbahAlamat extends StatelessWidget {
  const UbahAlamat({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              backgroundColor: const Color(0xff3A8C6E),
              body: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
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
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 300.0),
                    child: const Text("Alamat",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  TextField(
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Masukkan Alamat',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 170.0, top: 20),
                    child: const Text("Kota atau Kecamatan",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  TextField(
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Masukkan Kota atau Kecamatan',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 290.0, top: 30),
                    child: const Text("Kode Pos",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                  const SizedBox(
                    height: 20,
                    width: 100,
                  ),
                  TextField(
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Masukkan Kode Pos',
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(55.0),
                        child: SizedBox(
                          height: 50,
                          width: 1200,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 92, 223, 80),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {},
                              child: const Text(
                                "Simpan",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: "Popins",
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      height: 50,
                      width: 280,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 234, 41, 41),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: const Text(
                            "Hapus Alamat",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: "Popins",
                            ),
                          )),
                    ),
                  ),
                ],
              )),
        ));
  }
}
