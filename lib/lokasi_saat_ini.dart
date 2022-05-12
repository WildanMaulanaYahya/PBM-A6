import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_bottom1.dart';

class LokasiSaatIni extends StatefulWidget {
  const LokasiSaatIni({Key? key}) : super(key: key);

  @override
  State<LokasiSaatIni> createState() => _LokasiSaatIniState();
}

class _LokasiSaatIniState extends State<LokasiSaatIni> {
  @override
  Widget build(BuildContext context) {
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
                  'Lokasi Saat Ini',
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Alamat yang Terdeteksi',
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
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
                      hintText: '',
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            //gambar
            const SizedBox(height: 100),
            CustomButton(
              inputText: 'Simpan',
              onPressed: () {},
              color: const Color(0xff88E18B),
              textcolor: Colors.black,
            )
          ],
        )),
      ),
    );
  }
}
