import 'package:flutter/material.dart';

class UbahGender extends StatefulWidget {
  const UbahGender({Key? key}) : super(key: key);

  @override
  State<UbahGender> createState() => _UbahGenderState();
}

class _UbahGenderState extends State<UbahGender> {
  int? _value = 1;
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
                  const Text('Ubah Gender',
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Laki - Laki',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 200),
                              Radio(
                                  activeColor: Colors.black,
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value as int?;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Text(
                                'Perempuan',
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 185),
                              Radio(
                                  activeColor: Colors.black,
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value as int?;
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
