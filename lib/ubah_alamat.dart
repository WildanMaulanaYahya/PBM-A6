// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/costum_textfield2.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';

class UbahAlamat extends StatelessWidget {
  UbahAlamat({Key? key}) : super(key: key);
  var controller = TextEditingController();
//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xff3A8C6E),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
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
                        const Text("Ubah Alamat",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const CostumTextField2(
                        judul: 'Alamat', isi: 'Masukkan Alamat'),
                    const SizedBox(height: 20),
                    const CostumTextField2(
                        judul: 'Kota atau Kecamatan',
                        isi: 'Masukkan Kota atau Kecamatan'),
                    const SizedBox(height: 20),
                    const CostumTextField2(
                        judul: 'Kode Pos', isi: 'Masukkan Kode Pos'),
                    const SizedBox(height: 100),
                    CustomButton(
                      inputText: 'Simpan',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: const Color(0xff88E18B),
                      textcolor: Colors.black,
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                        inputText: 'Hapus Alamat',
                        onPressed: () {},
                        color: const Color(0xffFF0606),
                        textcolor: Colors.black)
                  ],
                ),
              ),
            )));
  }
}
