import 'package:flutter/material.dart';
import 'package:flutter_application_1/alamat.dart';
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
        resizeToAvoidBottomInset: false,
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
            const Text(
              'Alamat yang Terdeteksi',
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Alamat(),
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
