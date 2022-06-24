import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/lokasi_saat_ini.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:flutter_application_1/location/location_provider.dart';
import 'package:provider/provider.dart';

class TambahAlamat extends StatefulWidget {
  TambahAlamat({Key? key}) : super(key: key);

  @override
  State<TambahAlamat> createState() => _TambahAlamatState();
}

class _TambahAlamatState extends State<TambahAlamat> {
  var controller = TextEditingController();
  var alamat = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocationProvider>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xff3A8C6E),
        body: Form(
          key: _formKey,
          child: SafeArea(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 70),
                  const Text(
                    'Tambah alamat',
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller,
                      style:
                          const TextStyle(fontFamily: "Poppins", fontSize: 15),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Tulis nama jalan/gedung/perumahan',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama tidak boleh kosong';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        alamat = value;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                        onPressed: () {
                          provider.getLocation();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LokasiSaatIni()));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ))),
                        child: SizedBox(
                          height: 55,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                color: Color(0xff8E8E8E),
                              ),
                              Text(
                                'Gunakan Lokasi Saat Ini',
                                style: TextStyle(
                                    color: Color(0xff8E8E8E),
                                    fontFamily: "Poppins",
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 350),
              CustomButton(
                inputText: 'Simpan',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    add_alamat();
                  }
                },
                color: const Color(0xff88E18B),
                textcolor: Colors.black,
              ),
            ],
          )),
        ),
      ),
    );
  }

  void berhasil(BuildContext context) async {
    CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: "Berhasil",
        text: "Alamat berhasil ditambahkan",
        backgroundColor: const Color.fromARGB(255, 154, 195, 180),
        confirmBtnColor: const Color(0xff3A8C6E),
        onConfirmBtnTap: () {
          Navigator.of(context, rootNavigator: true).pop();
        });
  }

  void add_alamat() async {
    try {
      var collection = FirebaseFirestore.instance.collection('user');
      var res = await collection.add({'alamat': alamat});
      print(res);
      berhasil(context);
    } catch (e) {
      print('gagal ditambahkan');
    }
  }
}
