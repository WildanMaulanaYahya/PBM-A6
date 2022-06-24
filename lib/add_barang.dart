import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;
import 'bottom_navigation_bar.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({Key? key}) : super(key: key);

  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  var namaController = TextEditingController();
  var hargaController = TextEditingController();
  var tokoController = TextEditingController();
  var deskripsiController = TextEditingController();
  var stokController = TextEditingController();
  var terjualController = TextEditingController();
  var imageUrl;

  File? _image;
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
    final destination = 'barang/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('barang/');
      await ref.putFile(_image!);
      imageUrl = await ref.getDownloadURL();
      print(imageUrl);
    } catch (e) {
      print('error occured');
    }
  }

  var nama = '';
  var harga = 0;
  var toko = '';
  var deskripsi = '';
  var stok = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Tambah barang"),
            backgroundColor: const Color(0xff3A8C6E),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Form Tambah barang",
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: namaController,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Nama Barang',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'nama tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      nama = value;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: hargaController,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Harga',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'harga tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      harga = int.tryParse(value) ?? 0;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: tokoController,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Nama Toko',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'toko tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      toko = value;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: deskripsiController,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Deskripsi',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'deskripsi tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      deskripsi = value;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: stokController,
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'stok Barang',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'stok tidak boleh kosong';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      stok = int.tryParse(value) ?? 0;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 350,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          openGallery();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xff3A8C6E)),
                        icon: const Icon(Icons.upload_file_outlined),
                        label: const Text("Upload gambar",
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontSize: 15))),
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  inputText: "Simpan",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBarang();
                    }
                  },
                  color: const Color(0xff3A8C6E),
                  textcolor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void berhasil(BuildContext context) {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Success!",
        text: "Data Berhasil ditambahkan",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BottomNav()),
          );
        });
  }

  void addBarang() async {
    try {
      var collection = FirebaseFirestore.instance.collection('barang');

      var res = await collection.add({
        'nama_barang': nama,
        'harga': harga,
        'toko': toko,
        'Deskripsi': deskripsi,
        'stok': stok,
        'image': imageUrl.toString()
      });
      print('berhasil ditambahkan');
      print(res);
      berhasil(context);
    } catch (e) {
      print("gagal ditambahkan");
    }
  }
}
