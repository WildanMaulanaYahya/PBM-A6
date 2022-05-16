import 'package:flutter/material.dart';
import 'package:flutter_application_1/lokasi_saat_ini.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';
import 'package:flutter_application_1/location/location_provider.dart';
import 'package:provider/provider.dart';

class TambahAlamat extends StatelessWidget {
  const TambahAlamat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocationProvider>(context, listen: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff3A8C6E),
        body: SafeArea(
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
                  TextField(
                    style: const TextStyle(fontFamily: "Poppins", fontSize: 15),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Tulis nama jalan/gedung/perumahan',
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        provider.getLocation();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LokasiSaatIni()));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
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
              onPressed: () {},
              color: const Color(0xff88E18B),
              textcolor: Colors.black,
            ),
          ],
        )),
      ),
    );
  }
}
