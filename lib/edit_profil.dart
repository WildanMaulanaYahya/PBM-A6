// ignore_for_file: avoid_print
import 'package:cool_alert/cool_alert.dart';
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
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  var imageUrl;

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future openGallery() async {
    final imageGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (imageGallery != null) {
        _image = File(imageGallery.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_image == null) return;
    final fileName = path.basename(_image!.path);
    final destination = 'profile/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('profile/');
      await ref.putFile(_image!);
      imageUrl = await ref.getDownloadURL();
      addImage(Get.arguments);
    } catch (e) {
      print('error occured');
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("user").doc(docID);
    return docRef.get();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: FutureBuilder<DocumentSnapshot<Object?>>(
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
                                Get.back();
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
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        )
                                      : ClipOval(
                                          child: Image.network(
                                            "${(documentSnapshot as Map<String, dynamic>)["image"]}",
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                            color: const Color.fromARGB(
                                                208, 129, 129, 129),
                                            colorBlendMode: BlendMode.modulate,
                                          ),
                                        ),
                                  Positioned(
                                    top: 30,
                                    right: 25,
                                    child: IconButton(
                                      onPressed: () {
                                        openCamera();
                                      },
                                      icon:
                                          const Icon(Icons.camera_alt_outlined),
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
                    ket:
                        '${(documentSnapshot as Map<String, dynamic>)['nama_lengkap']}',
                    onPressed: () {
                      Get.to(() => UbahNama(), arguments: snapshot.data!.id);
                    },
                  ),
                  const SizedBox(height: 20),
                  CostumButton2(
                    nama: 'Gender',
                    ket:
                        '${(documentSnapshot as Map<String, dynamic>)["gender"]}',
                    onPressed: () => Get.to(() => UbahGender(),
                        arguments: snapshot.data!.id),
                  ),
                  const SizedBox(height: 20),
                  CostumButton2(
                      nama: 'Alamat',
                      ket:
                          '${(documentSnapshot as Map<String, dynamic>)["alamat"]}',
                      onPressed: () => Get.to(() => EditProfilAlamat(),
                          arguments: snapshot.data!.id)),
                  const SizedBox(height: 20),
                  CostumButton2(
                      nama: 'No HP',
                      ket: '${documentSnapshot['no_telepon']}',
                      onPressed: () => Get.to(() => UbahNoHP(),
                          arguments: snapshot.data!.id)),
                  const SizedBox(height: 20),
                  CostumButton2(
                      nama: 'Tanggal Lahir',
                      ket:
                          '${(documentSnapshot as Map<String, dynamic>)['tgl_lahir']}',
                      onPressed: () => Get.to(() => UbahTanggal(),
                          arguments: snapshot.data!.id)),
                  const SizedBox(height: 20),
                  CostumButton2(
                      nama: 'E-mail',
                      ket:
                          '${(documentSnapshot as Map<String, dynamic>)['email']}',
                      onPressed: () => Get.to(() => UbahEmail(),
                          arguments: snapshot.data!.id))
                ],
              );
            }),
      ),
    );
  }

  void alert_berhasil(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success",
        text: "Berhasil mengubah foto profil",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          Get.back();
          Get.back();
        });
  }

  void alert_salah(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        title: "Terjadi kesalahan",
        text: "Tidak berhasil mengubah foto profil",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.pop(context);
          Get.back();
          Get.back();
        });
  }

  void addImage(String docID) async {
    DocumentReference docdata =
        FirebaseFirestore.instance.collection('user').doc(docID);
    var image = imageUrl.toString();

    try {
      await docdata.update({"image": image});
      alert_berhasil(context);
    } catch (e) {
      alert_salah(context);
    }
  }
}
