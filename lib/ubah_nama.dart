import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_textfield_3.dart';

class UbahNama extends StatelessWidget {
  const UbahNama({Key? key}) : super(key: key);

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
            const SizedBox(height: 30),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded),
                  ),
                  const SizedBox(width: 10),
                  const Text('Ubah Nama',
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(width: 140),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Simpan',
                          style: TextStyle(
                            color: Color(0xff3A8C6E),
                            fontFamily: "Poppins",
                            fontSize: 16,
                          )))
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xffF2F1F1),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: CustomTextField3(),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
