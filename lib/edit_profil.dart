// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ubah_email.dart';
import 'package:flutter_application_1/ubah_gender.dart';
import 'package:flutter_application_1/ubah_nama.dart';
import 'package:flutter_application_1/ubah_nohp.dart';
import 'package:flutter_application_1/ubah_tanggal.dart';
import 'editprofil_alamat.dart';
import 'widget/custom_button_edit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    _image = File(pickedImage!.path);
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    _image = File(imageGallery!.path);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var users = FirebaseFirestore.instance.collection('user');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: StreamBuilder<QuerySnapshot<Object?>>(
            stream: users.snapshots(),
            builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                var listdata = snapshot.data!.docs as Map<String, dynamic>;

                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 15),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_outlined),
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 80),
                            Column(
                              children: [
                                Stack(
                                  children: [
                                    _image != null
                                        ? ClipOval(
                                            child: Image.file(
                                              _image!,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              color: const Color.fromARGB(
                                                  208, 129, 129, 129),
                                              colorBlendMode:
                                                  BlendMode.modulate,
                                            ),
                                          )
                                        : ClipOval(
                                            child: Image.asset(
                                              'images/profil.png',
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                              color: const Color.fromARGB(
                                                  208, 129, 129, 129),
                                              colorBlendMode:
                                                  BlendMode.modulate,
                                            ),
                                          ),
                                    Positioned(
                                      top: 30,
                                      right: 25,
                                      child: IconButton(
                                        onPressed: () {
                                          openCamera();
                                        },
                                        icon: const Icon(
                                            Icons.camera_alt_outlined),
                                        color: Colors.white,
                                        iconSize: 30,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 95,
                                  height: 28,
                                  child: TextButton(
                                      onPressed: () {
                                        openGallery();
                                      },
                                      style: TextButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffFCD857),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      child: const Text(
                                        'Edit',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontFamily: "Popins",
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CostumButton2(
                        nama: 'Name',
                        ket: '${listdata['nama_lengkap']}',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UbahNama()),
                          );
                        },
                        width: 80),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Username',
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            SizedBox(width: 80),
                            Text(
                              'Wildan Provak',
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CostumButton2(
                        nama: 'Gender',
                        ket: 'Male',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UbahGender()),
                          );
                        },
                        width: 150),
                    const SizedBox(height: 20),
                    CostumButton2(
                        nama: 'Alamat',
                        ket: 'Jl. Mangga III No 17',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfilAlamat()));
                        },
                        width: 52),
                    const SizedBox(height: 20),
                    CostumButton2(
                        nama: 'No HP',
                        ket: '${listdata['no_telepon']}',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UbahNoHP()));
                        },
                        width: 97),
                    const SizedBox(height: 20),
                    CostumButton2(
                        nama: 'Tanggal Lahir',
                        ket: '1 Juni 2002',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const UbahTanggal())));
                        },
                        width: 65),
                    const SizedBox(height: 20),
                    CostumButton2(
                        nama: 'E-mail',
                        ket: 'wildan@gmail.com',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UbahEmail()));
                        },
                        width: 53),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }),
      ),
    );
  }
}
